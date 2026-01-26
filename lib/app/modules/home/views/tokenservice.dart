// token_service.dart
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterwallet/Applinks.dart';
// import 'package:flutterwallet/app/Applinks.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  static final TokenService _instance = TokenService._internal();
  factory TokenService() => _instance;
  TokenService._internal();

  // Variables
  Timer? _refreshTimer;
  DateTime? _lastRefreshTime;
  
  // Methods that can be called from anywhere
  Future<void> refreshTokenForDialog() async {
    try {
      print('🔄 [Dialog] بدء تجديد التوكن للديالوج');
      
      final prefs = await SharedPreferences.getInstance();
      final refreshToken = prefs.getString('refreshtoken');
      final userId = prefs.getInt('userId');
      
      if (refreshToken == null || refreshToken.isEmpty) {
        print('❌ [Dialog] لا يوجد refresh token');
        return;
      }
      
      // Check if we refreshed recently
      if (_lastRefreshTime != null) {
        final timeSinceLastRefresh = DateTime.now().difference(_lastRefreshTime!);
        if (timeSinceLastRefresh.inSeconds < 30) {
          print('⏸️ [Dialog] تم التجديد مؤخراً');
          return;
        }
      }
      
      // Call refresh endpoint
      final res = await Dio().post(
        '${Applinks.baseurl}/auth/refreshtoken',
        data: {'refreshtoken': refreshToken},
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final newToken = res.data['token'];
        
        // Save the new token
        await prefs.setString('token', newToken);
        _lastRefreshTime = DateTime.now();
        
        print('✅ [Dialog] تم تجديد التوكن بنجاح');
        
        // Schedule next refresh for dialog
        _scheduleNextRefreshForDialog(newToken);
        
      } else {
        print('❌ [Dialog] فشل تجديد التوكن: ${res.statusCode}');
      }
      
    } catch (e) {
      print('❌ [Dialog] خطأ في تجديد التوكن: $e');
    }
  }
  
  void _scheduleNextRefreshForDialog(String token) {
    _refreshTimer?.cancel();
    
    try {
      final expiryDate = JwtDecoder.getExpirationDate(token);
      final remaining = expiryDate.difference(DateTime.now());
      
      print('⏳ [Dialog] صلاحية التوكن: ${remaining.inMinutes} دقيقة');
      
      // Refresh 10 minutes before expiration
      final refreshTime = remaining - Duration(minutes: 10);
      
      if (refreshTime.isNegative) {
        // If less than 10 minutes remain, refresh after 1 minute
        print('⏱️ [Dialog] بقي أقل من 10 دقائق - جدد بعد دقيقة');
        _refreshTimer = Timer(Duration(minutes: 1), () {
          refreshTokenForDialog();
        });
      } else {
        // Normal scheduling
        print('📅 [Dialog] سأجدد بعد ${refreshTime.inMinutes} دقيقة');
        _refreshTimer = Timer(refreshTime, () {
          refreshTokenForDialog();
        });
      }
      
    } catch (e) {
      print('❌ [Dialog] خطأ في جدولة التجديد: $e');
    }
  }
  
  // Check if token is valid (for dialog to decide whether to refresh)
  Future<bool> isTokenValidForDialog() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      
      if (token == null || token.isEmpty) {
        return false;
      }
      
      // Check if token is expired
      if (JwtDecoder.isExpired(token)) {
        print('⏰ [Dialog] التوكن منتهي');
        return false;
      }
      
      final expiryDate = JwtDecoder.getExpirationDate(token);
      final remaining = expiryDate.difference(DateTime.now());
      
      // If less than 5 minutes remain, we should refresh
      if (remaining.inMinutes < 5) {
        print('⚠️ [Dialog] التوكن سينتهي قريباً (${remaining.inMinutes} دقيقة)');
        return false;
      }
      
      return true;
      
    } catch (e) {
      print('❌ [Dialog] خطأ في التحقق من التوكن: $e');
      return false;
    }
  }
  
  // Start monitoring token for dialog
  void startTokenMonitoringForDialog() {
    print('🚀 [Dialog] بدء مراقبة التوكن للديالوج');
    
    // Check immediately
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final isValid = await isTokenValidForDialog();
      if (!isValid) {
        await refreshTokenForDialog();
      } else {
        // Schedule refresh based on current token
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('token');
        if (token != null) {
          _scheduleNextRefreshForDialog(token);
        }
      }
    });
  }
  
  // Stop monitoring (call this when dialog closes)
  void stopTokenMonitoringForDialog() {
    print('⏹️ [Dialog] إيقاف مراقبة التوكن للديالوج');
    _refreshTimer?.cancel();
    _refreshTimer = null;
  }
}