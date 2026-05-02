/// Model dữ liệu cho thời tiết
class WeatherData {
  final String cityName;
  final String country;
  final double temperature;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int humidity;
  final int pressure;
  final double windSpeed;
  final String description;
  final String main; // Clear, Clouds, Rain, etc.
  final int clouds;
  final int sunrise;
  final int sunset;

  WeatherData({
    required this.cityName,
    required this.country,
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.description,
    required this.main,
    required this.clouds,
    required this.sunrise,
    required this.sunset,
  });

  /// Factory constructor để tạo từ JSON
  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      cityName: json['name'] ?? 'Unknown',
      country: json['sys']['country'] ?? 'Unknown',
      temperature: (json['main']['temp'] ?? 0).toDouble(),
      feelsLike: (json['main']['feels_like'] ?? 0).toDouble(),
      tempMin: (json['main']['temp_min'] ?? 0).toDouble(),
      tempMax: (json['main']['temp_max'] ?? 0).toDouble(),
      humidity: json['main']['humidity'] ?? 0,
      pressure: json['main']['pressure'] ?? 0,
      windSpeed: (json['wind']['speed'] ?? 0).toDouble(),
      description: json['weather'][0]['description'] ?? 'N/A',
      main: json['weather'][0]['main'] ?? 'Unknown',
      clouds: json['clouds']['all'] ?? 0,
      sunrise: json['sys']['sunrise'] ?? 0,
      sunset: json['sys']['sunset'] ?? 0,
    );
  }

  /// Chuyển đổi thời gian Unix timestamp sang giờ
  String getFormattedTime(int timestamp) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  /// Lấy emoji dựa trên loại thời tiết
  String getWeatherEmoji() {
    const weatherMap = {
      'Clear': '☀️',
      'Clouds': '☁️',
      'Rain': '🌧️',
      'Drizzle': '🌦️',
      'Thunderstorm': '⛈️',
      'Snow': '❄️',
      'Mist': '🌫️',
      'Smoke': '💨',
      'Haze': '🌫️',
      'Dust': '🌪️',
      'Fog': '🌫️',
      'Sand': '🌪️',
      'Ash': '🌋',
      'Squall': '💨',
      'Tornado': '🌪️',
    };
    return weatherMap[main] ?? '🌡️';
  }

  /// Phân loại chỉ số UV (dự tính)
  String getUVIndex() {
    if (clouds > 80) return 'Thấp (1-2)';
    if (clouds > 50) return 'Trung bình (3-5)';
    if (clouds > 20) return 'Cao (6-7)';
    return 'Rất cao (8+)';
  }
}

/// Danh sách các thành phố phổ biến
class PopularCities {
  static const List<String> cities = [
    'Hanoi',
    'Ho Chi Minh City',
    'Da Nang',
    'Hai Phong',
    'Can Tho',
    'Hue',
    'Nha Trang',
    'Da Lat',
  ];
}