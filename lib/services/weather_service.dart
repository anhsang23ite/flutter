import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather_model.dart';

/// Service để lấy dữ liệu thời tiết từ API OpenWeatherMap
class WeatherService {
  // Thay bằng API key của bạn
  static const String apiKey = 'e306b7d16a9bc9ea10ffded853858e19';
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  /// Lấy thời tiết theo tên thành phố
  static Future<WeatherData> getWeatherByCity(String cityName) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl?q=$cityName&appid=$apiKey&units=metric&lang=vi',
        ),
      ).timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          throw Exception('Hết thời gian chờ yêu cầu');
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return WeatherData.fromJson(jsonData);
      } else {
        return _mockWeatherData(cityName);
      }
    } catch (e) {
      return _mockWeatherData(cityName);
    }
  }

  /// Lấy thời tiết theo tọa độ
  static Future<WeatherData> getWeatherByCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric&lang=vi',
        ),
      ).timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          throw Exception('Hết thời gian chờ yêu cầu');
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return WeatherData.fromJson(jsonData);
      } else {
        return _mockWeatherData('Hanoi');
      }
    } catch (e) {
      return _mockWeatherData('Hanoi');
    }
  }

  /// Tìm kiếm các thành phố gợi ý
  static Future<List<String>> searchCities(String query) async {
    final cities = PopularCities.cities
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return cities;
  }

  /// Kiểm tra kết nối API
  static Future<bool> testConnection() async {
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl?q=London&appid=$apiKey',
        ),
      ).timeout(
        const Duration(seconds: 10),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  static WeatherData _mockWeatherData(String cityName) {
    return WeatherData(
      cityName: cityName,
      country: 'VN',
      temperature: 28.0,
      feelsLike: 29.5,
      tempMin: 26.0,
      tempMax: 31.0,
      humidity: 68,
      pressure: 1012,
      windSpeed: 3.6,
      description: 'Nhiều mây',
      main: 'Clouds',
      clouds: 75,
      sunrise: DateTime.now().subtract(const Duration(hours: 6)).millisecondsSinceEpoch ~/ 1000,
      sunset: DateTime.now().add(const Duration(hours: 6)).millisecondsSinceEpoch ~/ 1000,
    );
  }
}
