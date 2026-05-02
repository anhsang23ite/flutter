import 'package:geolocator/geolocator.dart';

/// Service để lấy vị trí của người dùng
class LocationService {
  /// Kiểm tra quyền truy cập vị trí
  static Future<bool> checkLocationPermission() async {
    try {
      final permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        // Yêu cầu quyền
        final newPermission = await Geolocator.requestPermission();
        return newPermission != LocationPermission.denied &&
            newPermission != LocationPermission.deniedForever;
      }

      if (permission == LocationPermission.deniedForever) {
        // Quyền bị từ chối vĩnh viễn
        return false;
      }

      return true;
    } catch (e) {
      print('Lỗi kiểm tra quyền: $e');
      return false;
    }
  }

  /// Lấy vị trí hiện tại
  static Future<Position> getCurrentLocation() async {
    try {
      final hasPermission = await checkLocationPermission();
      if (!hasPermission) {
        return _mockPosition();
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );
      return position;
    } catch (e) {
      print('Lỗi lấy vị trí: $e');
      return _mockPosition();
    }
  }

  static Position _mockPosition() {
    return Position(
      latitude: 21.0285,
      longitude: 105.8542,
      timestamp: DateTime.now(),
      accuracy: 100.0,
      altitude: 0.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
      altitudeAccuracy: 0.0,
      headingAccuracy: 0.0,
    );
  }

  /// Theo dõi vị trí thay đổi theo thời gian thực
  static Stream<Position> getLocationStream() {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100, // Cập nhật khi di chuyển 100m
      ),
    );
  }

  /// Kiểm tra xem dịch vụ vị trí có bật không
  static Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  /// Mở cài đặt vị trí
  static Future<bool> openLocationSettings() async {
    return await Geolocator.openLocationSettings();
  }

  /// Mở cài đặt ứng dụng
  static Future<bool> openAppSettings() async {
    return await Geolocator.openAppSettings();
  }

  /// Tính toán khoảng cách giữa hai điểm
  static double calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    return Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
  }
}
