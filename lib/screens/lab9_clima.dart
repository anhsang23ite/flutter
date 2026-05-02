import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:labs_app/models/weather_model.dart';
import 'package:labs_app/services/weather_service.dart';
import 'package:labs_app/services/location_service.dart';

class Lab9_Clima extends StatefulWidget {
  const Lab9_Clima({Key? key}) : super(key: key);

  @override
  State<Lab9_Clima> createState() => _Lab9_ClimaState();
}

class _Lab9_ClimaState extends State<Lab9_Clima> {
  WeatherData? weatherData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  Future<void> loadWeather() async {
    setState(() {
      isLoading = true;
    });

    final weather = await WeatherService.getWeatherByCity('Hanoi');
    setState(() {
      weatherData = weather;
      isLoading = false;
    });
  }

  Future<void> loadWeatherByLocation() async {
    setState(() {
      isLoading = true;
    });

    try {
      final position = await LocationService.getCurrentLocation();
      final weather = await WeatherService.getWeatherByCoordinates(
        position.latitude,
        position.longitude,
      );
      setState(() {
        weatherData = weather;
      });
    } catch (e) {
      debugPrint('Lỗi: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🌤️ Clima'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : weatherData == null
                ? const Center(
                    child: Text(
                      'Không có dữ liệu thời tiết.',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        weatherData!.cityName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        weatherData!.description,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '${weatherData!.temperature.toStringAsFixed(1)}°C',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Cảm giác như ${weatherData!.feelsLike.toStringAsFixed(1)}°C',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Độ ẩm: ${weatherData!.humidity}% ',
                            style: const TextStyle(color: Colors.white70),
                          ),
                          Text(
                            'Gió: ${weatherData!.windSpeed} m/s',
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: loadWeather,
                        child: const Text('Tải lại thời tiết Hà Nội'),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: loadWeatherByLocation,
                        child: const Text('Lấy thời tiết theo vị trí'),
                      ),
                    ],
                  ),
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}