// services/auth_service.dart
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Timer? _refreshTimer;

  String token = '';
  String refreshToken = '';
  int userId = 0;

  // ================= TOKENS =================
  Future<Map<String, dynamic>?> loadTokens() async {
    final prefs = await SharedPreferences.getInstance();
    final t = prefs.getString('token');
    final rt = prefs.getString('refreshtoken');
    final uid = prefs.getInt('userId');

    if (t == null || rt == null) return null;

    token = t;
    refreshToken = rt;
    userId = uid ?? 0;

    return {'token': token, 'refreshtoken': refreshToken};
  }

  Future<void> saveTokens(String t, String rt, int uid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', t);
    await prefs.setString('refreshtoken', rt);
    await prefs.setInt('userId', uid);

    token = t;
    refreshToken = rt;
    userId = uid;
  }

  // ================= AUTO REFRESH =================
  void startAutoRefresh() {
    _refreshTimer?.cancel();

    if (token.isEmpty) return;

    final expiry = JwtDecoder.getExpirationDate(token);
    final remaining = expiry.difference(DateTime.now());

    if (remaining.isNegative) {
      refreshAccessToken();
      return;
    }

    final refreshAt = remaining - const Duration(minutes: 1);
    _refreshTimer = Timer(refreshAt, refreshAccessToken);
  }

  Future<void> refreshAccessToken() async {
    final res = await Dio().post(
      'http://localhost:3300/auth/refreshtoken',
      data: {'refreshtoken': refreshToken},
    );

    await saveTokens(res.data['token'], refreshToken, userId);
    startAutoRefresh();
  }

  // ================= LOGOUT =================
  Future<void> logout() async {
    _refreshTimer?.cancel();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
