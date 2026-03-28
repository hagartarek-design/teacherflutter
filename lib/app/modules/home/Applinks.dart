import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/views/tokenservice.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Applinks {
  
  static String baseurl = 'http://localhost:3300';
  TokenService tokenService = TokenService();

  getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token}",
    };
  }

  final Dio dio = Dio(BaseOptions(baseUrl: baseurl, headers: {
    "Content-Type": "application/json",
    // "Authorization": "Bearer ${controller.token}",
  }));

// static const baseurl=  'http://192.168.1.6:3000';
// static const baseurl=  'http://192.168.1.6:3000';
  Future postdio(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final headers = await getHeaders();
    final response = await dio.post(endpoint,
        data: data, options: Options(headers: headers));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      throw Exception('Error:${response.statusCode}');
    }
  }

  Future delete(String endpoint, context) async {
    final headers = await getHeaders();
    final uri = Uri.parse('$baseurl$endpoint');
    http.Response response = await http.delete(uri, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      _showErrorSnackBar(context, response);
      throw Exception('Error${response.statusCode}-${response.body}');
    }
  }

  Future get(String endpoint, context,
      {Map<String, String>? queryParams, int? page, int? limit}) async {
    final headers = await getHeaders();
    final uri = Uri.parse('$baseurl$endpoint').replace(queryParameters: {
      if (page != null) 'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
      ...?queryParams
    });
    final http.Response response = await http.get(uri, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      _showErrorSnackBar(context, response);
      throw Exception('API Error${response.statusCode}-${response.body}');
    }
  }

  Future getall(
    String endpoint, {
    Map<String, String?>? queryParams,
    int? page,
    int? limit,
  }) async {
    final headers = await getHeaders();
    final uri = Uri.parse('$baseurl$endpoint').replace(
      queryParameters: {
        if (page != null) 'page': page.toString(),
        if (limit != null) 'limit': limit.toString(),
        ...?queryParams,
      }..removeWhere((key, value) => value == null),
    );
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('API Error ${response.statusCode} - ${response.body}');
    }
  }

  Future post(String endpoint, Map<String, dynamic> data, context) async {
    final headers = await getHeaders();
    final uri = Uri.parse('$baseurl$endpoint');
    final http.Response response =
        await http.post(uri, headers: headers, body: json.encode(data));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      _showErrorSnackBar(context, response);
      throw Exception('Error:${response.statusCode}-${response.body}');
    }
  }

  Future put(String endpoint, Map<String, dynamic> data, context) async {
    final headers = await getHeaders();
    final uri = Uri.parse('$baseurl$endpoint');
    http.Response response =
        await http.put(uri, headers: headers, body: json.encode(data));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      _showErrorSnackBar(context, response);
      throw Exception('Error:${response.statusCode}-${response.body}');
    }
  }

  Future patch(String endpoint, Map<String, dynamic> data, context) async {
    final headers = await getHeaders();
    final uri = Uri.parse('$baseurl$endpoint');
    http.Response response =
        await http.patch(uri, headers: headers, body: json.encode(data));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      _showErrorSnackBar(context, response);
      throw Exception('Error:${response.statusCode}-${response.body}');
    }
  }

  // static const baseurl='http://192.168.1.2:3000';
  // static const baseurl='http://192.168.1.6:3000';
  // static const baseurl='http://192.168.43.75:3000';
  void _showErrorSnackBar(BuildContext context, response) {
    try {
      final message = response.data['message'] ?? 'An error occurred';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
