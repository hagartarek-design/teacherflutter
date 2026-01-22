import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  static Timer? _refreshTimer;
 static Future<void> saveTokens(
      String accessToken, String refreshToken, int userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', accessToken);
    await prefs.setString('refreshtoken', refreshToken);
    await prefs.setInt('userId', userId);
  }

  static Future<Map<String, dynamic>?> getTokens() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final refreshToken = prefs.getString('refreshtoken');
    final userId = prefs.getInt('userId');

    if (token != null && refreshToken != null && userId != null) {
      return {
        'token': token,
        'refreshtoken': refreshToken,
        'userId': userId,
      };
    }
    return null;
  }

  static void startAutoRefresh() {
    _refreshTimer?.cancel();

    _refreshTimer = Timer.periodic(
      const Duration(minutes: 4), // أقل من expiration
      (_) async {
        await refreshToken();
      },
    );
  }

  static void stopAutoRefresh() {
    _refreshTimer?.cancel();
  }

  static Future<void> refreshToken() async {
    final tokens = await getTokens();
    if (tokens == null) return;

    try {
      final res = await Dio().post(
        'http://localhost:4000/auth/refresh',
        data: {'refreshtoken': tokens['refreshtoken']},
      );

      await saveTokens(
        res.data['token'],
        res.data['refreshtoken'] ?? tokens['refreshtoken'],
        tokens['userId'],
      );
    } catch (e) {
      await logout();
    }
  }

  // ================= LOGOUT =================
  static Future<void> logout() async {
    stopAutoRefresh();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed('/main');
  }
}
