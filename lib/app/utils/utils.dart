import 'dart:io';


import 'package:device_info_plus/device_info_plus.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Utils {
  static const _authRoutes = [
    '/splash',
    '/login',
    '/signup',
    '/verify_otp',
    '/forgot_password',
    '/reset_password',
    '/change_password',
  ];

  static bool isAuthRoute(String location) {
    return _authRoutes.any(
      (path) => location == path || location.startsWith(path),
    );
  }


  static String convertUtcToLocalString(String? utcString) {
    if (utcString == null || utcString.isEmpty) {
      return '';
    }

    try {
      DateTime utcDateTime = DateTime.parse(utcString);
      DateTime localDateTime = utcDateTime.toLocal();

      return DateFormat('dd/MM/yy').format(localDateTime);
    } catch (e) {
      return '';
    }
  }

  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  static Future<String?> getDeviceId() async {
    try {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfoPlugin.androidInfo;
        return androidInfo.id;
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfoPlugin.iosInfo;
        return iosInfo.identifierForVendor;
      } else {
        return null; // Unsupported platform
      }
    } catch (e) {
      return "Error fetching device id";
    }
  }

  /// Save dashboard component order to SharedPreferences
  static Future<void> saveDashboardComponentOrder(List<String> order) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('dashboard_component_order', order);
  }


}
