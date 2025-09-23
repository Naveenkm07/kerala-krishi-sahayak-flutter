class ApiConfig {
  // API Keys - Replace with your actual keys
  static const String googleApiKey = String.fromEnvironment(
    'GOOGLE_API_KEY', 
    defaultValue: 'YOUR_NEW_GOOGLE_API_KEY_HERE'
  );
  
  static const String weatherApiKey = String.fromEnvironment(
    'WEATHER_API_KEY', 
    defaultValue: 'YOUR_NEW_WEATHER_API_KEY_HERE'
  );
  
  // API URLs
  static const String geminiApiUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent';
  static const String weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';
  
  // Build API URLs with keys
  static String get geminiUrl => '$geminiApiUrl?key=$googleApiKey';
  static String weatherUrl({String? location, double? lat, double? lon}) {
    if (lat != null && lon != null) {
      return '$weatherApiUrl?lat=$lat&lon=$lon&appid=$weatherApiKey&units=metric';
    } else {
      return '$weatherApiUrl?q=$location&appid=$weatherApiKey&units=metric';
    }
  }
}
