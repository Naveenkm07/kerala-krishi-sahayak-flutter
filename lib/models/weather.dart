class WeatherData {
  final String location;
  final double temperature;
  final int humidity;
  final double rainfall;
  final double windSpeed;
  final String condition;

  WeatherData({
    required this.location,
    required this.temperature,
    required this.humidity,
    required this.rainfall,
    required this.windSpeed,
    required this.condition,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      location: json['location'] ?? '',
      temperature: (json['temperature'] ?? 0).toDouble(),
      humidity: json['humidity'] ?? 0,
      rainfall: (json['rainfall'] ?? 0).toDouble(),
      windSpeed: (json['windSpeed'] ?? 0).toDouble(),
      condition: json['condition'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location,
      'temperature': temperature,
      'humidity': humidity,
      'rainfall': rainfall,
      'windSpeed': windSpeed,
      'condition': condition,
    };
  }
}

class ForecastItem {
  final String day;
  final String temp;
  final String condition;
  final String rain;

  ForecastItem({
    required this.day,
    required this.temp,
    required this.condition,
    required this.rain,
  });

  factory ForecastItem.fromJson(Map<String, dynamic> json) {
    return ForecastItem(
      day: json['day'] ?? '',
      temp: json['temp'] ?? '',
      condition: json['condition'] ?? '',
      rain: json['rain'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'temp': temp,
      'condition': condition,
      'rain': rain,
    };
  }
}
