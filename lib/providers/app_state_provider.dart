import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import '../models/farmer.dart';
import '../models/weather.dart';
import '../models/alert.dart';
import '../data/app_data.dart';

class AppStateProvider extends ChangeNotifier {
  Farmer? _currentUser;
  List<Alert> _alerts = [];
  WeatherData? _currentWeather;
  List<ForecastItem> _forecast = [];
  List<SchemeInfo> _schemes = [];
  List<PestDiseaseInfo> _pestDiseases = [];
  List<Map<String, dynamic>> _cropCalendar = [];
  List<Map<String, String>> _chatHistory = [];

  // Getters
  Farmer? get currentUser => _currentUser;
  List<Alert> get alerts => _alerts;
  WeatherData? get currentWeather => _currentWeather;
  List<ForecastItem> get forecast => _forecast;
  List<SchemeInfo> get schemes => _schemes;
  List<PestDiseaseInfo> get pestDiseases => _pestDiseases;
  List<Map<String, dynamic>> get cropCalendar => _cropCalendar;
  List<Map<String, String>> get chatHistory => _chatHistory;
  
  bool get isAuthenticated => _currentUser != null;

  AppStateProvider() {
    _initializeData();
  }

  void _initializeData() {
    _loadUserData();
    _loadAppData();
  }

  Future<void> _loadUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = prefs.getString('currentUser');
      
      if (userData != null) {
        final userJson = jsonDecode(userData);
        _currentUser = Farmer.fromJson(userJson);
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error loading user data: $e');
    }
  }

  void _loadAppData() {
    // Load static data from app_data.dart
    _alerts = AppData.alerts.map((alert) => Alert.fromJson(alert)).toList();
    _currentWeather = WeatherData.fromJson(AppData.weather['current']);
    _forecast = (AppData.weather['forecast'] as List)
        .map((item) => ForecastItem.fromJson(item))
        .toList();
    _schemes = AppData.schemes.map((scheme) => SchemeInfo.fromJson(scheme)).toList();
    _pestDiseases = AppData.pestDiseases.map((pest) => PestDiseaseInfo.fromJson(pest)).toList();
    _cropCalendar = List<Map<String, dynamic>>.from(AppData.cropCalendar);
    
    // Load real weather data if internet available
    _loadRealWeatherData();
    notifyListeners();
  }

  // Get User's Real Location
  Future<Position?> _getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        debugPrint('Location services are disabled.');
        return null;
      }

      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          debugPrint('Location permissions are denied');
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        debugPrint('Location permissions are permanently denied');
        return null;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return position;
    } catch (e) {
      debugPrint('Error getting location: $e');
      return null;
    }
  }

  // Real Weather API using GPS location
  Future<void> _loadRealWeatherData() async {
    try {
      // Try to get real GPS location first
      Position? position = await _getCurrentLocation();
      
      String weatherUrl;
      if (position != null) {
        // Use GPS coordinates for more accurate weather
        weatherUrl = 'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=d6a313375646b1eb9a3d49c8e8de16d4&units=metric';
      } else {
        // Fallback to user's saved location or default Kerala location
        final location = _currentUser?.location ?? 'Wayanad,Kerala';
        weatherUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=d6a313375646b1eb9a3d49c8e8de16d4&units=metric';
      }

      final response = await http.get(Uri.parse(weatherUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _currentWeather = WeatherData(
          location: '${data['name']}, ${data['sys']['country']}',
          temperature: data['main']['temp'].round(),
          humidity: data['main']['humidity'],
          rainfall: 0,
          windSpeed: data['wind']['speed'].round(),
          condition: data['weather'][0]['description'],
        );
        notifyListeners();
      }
    } catch (e) {
      // Keep static data if API fails
      debugPrint('Weather API error: $e');
    }
  }

  // Refresh weather data manually
  Future<void> refreshWeatherData() async {
    await _loadRealWeatherData();
  }

  Future<bool> registerUser({
    required String name,
    required String phone,
    required String location,
    required List<String> crops,
  }) async {
    try {
      // Validate input
      if (name.isEmpty || phone.isEmpty || location.isEmpty || crops.isEmpty) {
        return false;
      }

      // Phone validation for Indian numbers
      final phoneRegex = RegExp(r'^[6-9]\d{9}$');
      if (!phoneRegex.hasMatch(phone)) {
        return false;
      }

      final newUser = Farmer(
        id: DateTime.now().millisecondsSinceEpoch,
        name: name,
        phone: phone,
        location: '$location, Kerala',
        crops: crops,
        landArea: '2.0 acres', // Default value
        soilType: 'Laterite', // Default for Kerala
        registrationDate: DateTime.now().toIso8601String(),
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('currentUser', jsonEncode(newUser.toJson()));

      _currentUser = newUser;
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint('Error registering user: $e');
      return false;
    }
  }

  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('currentUser');
      _currentUser = null;
      _chatHistory.clear();
      notifyListeners();
    } catch (e) {
      debugPrint('Error logging out: $e');
    }
  }

  void addChatMessage(String message, String sender) {
    _chatHistory.add({
      'message': message,
      'sender': sender,
      'timestamp': DateTime.now().toIso8601String(),
    });
    notifyListeners();
  }

  // Real AI Response using Google Gemini API
  Future<String> getAIResponse(String userMessage) async {
    try {
      // Check internet connectivity first
      final response = await http.post(
        Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyBL82J_NU4PV5crAfAmgrCQl75JrT-hmmQ'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'contents': [{
            'parts': [{
              'text': 'You are a Kerala farming assistant. Answer in both Malayalam and English. User asks: $userMessage'
            }]
          }]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['candidates'][0]['content']['parts'][0]['text'];
      } else {
        return _getFallbackResponse(userMessage);
      }
    } catch (e) {
      // Fallback to offline responses if no internet
      return _getFallbackResponse(userMessage);
    }
  }

  // Fallback for offline mode
  String _getFallbackResponse(String userMessage) {
    final message = userMessage.toLowerCase();
    
    // Check for exact matches first
    for (final entry in AppData.aiResponses.entries) {
      if (message.contains(entry.key.toLowerCase())) {
        return entry.value;
      }
    }
    
    // Pattern matching for common queries
    if (message.contains('weather') || message.contains('കാലാവസ്ഥ')) {
      return 'Current weather in ${_currentUser?.location ?? 'your area'}: '
          '${_currentWeather?.temperature ?? 28}°C, ${_currentWeather?.condition ?? 'Partly Cloudy'}. '
          'Humidity: ${_currentWeather?.humidity ?? 78}%. Expected rain in 2-3 days, ensure proper drainage in your fields.';
    }
    
    if (message.contains('irrigation') || message.contains('വെള്ളം')) {
      return AppData.aiResponses['irrigation'] ?? 'Please ensure proper irrigation based on current weather conditions.';
    }
    
    if (message.contains('pest') || message.contains('കീട')) {
      return AppData.aiResponses['pest control'] ?? 'Monitor your crops regularly for pest activity.';
    }
    
    if (message.contains('fertilizer') || message.contains('വളം')) {
      return AppData.aiResponses['fertilizer'] ?? 'Apply fertilizers based on soil testing and crop requirements.';
    }
    
    if (message.contains('coconut') || message.contains('തെങ്ങ്')) {
      return AppData.aiResponses['coconut'] ?? 'Coconut trees require regular care and monitoring.';
    }
    
    if (message.contains('paddy') || message.contains('നെൽ')) {
      return AppData.aiResponses['പാടി കൃഷി'] ?? 'Paddy cultivation requires proper water management.';
    }
    
    if (message.contains('spice') || message.contains('സുഗന്ധവ്യഞ്ജനം')) {
      return AppData.aiResponses['spices'] ?? 'Spice cultivation requires specific care and attention.';
    }
    
    // Default response
    return 'Thank you for your question about "$userMessage". Based on Kerala farming practices, I recommend consulting with your local agricultural officer for specific guidance. You can also check the government schemes section for relevant programs that might help with your farming needs.\n\nനിങ്ങളുടെ ചോദ്യത്തിന് നന്ദി. കൂടുതൽ വിവരങ്ങൾക്ക് നിങ്ങളുടെ പ്രാദേശിക കാർഷിക ഓഫീസറുമായി ബന്ധപ്പെടുക.';
  }

  void clearChatHistory() {
    _chatHistory.clear();
    notifyListeners();
  }

  Future<void> updateProfile(Farmer updatedUser) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('currentUser', jsonEncode(updatedUser.toJson()));
      _currentUser = updatedUser;
      notifyListeners();
    } catch (e) {
      debugPrint('Error updating profile: $e');
    }
  }
}
