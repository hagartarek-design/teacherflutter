import 'dart:convert';
import 'package:flutterwallet/Applinks.dart';
import 'package:flutterwallet/app/modules/home/modules/students.dart';
import 'package:flutterwallet/app/modules/home/views/progress.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'students.dart'; 


 
// class ApiService {
  class ApiService {
 


  static Future<List<Student>> searchStudentsCourse(String query) async {
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http .get(
      Uri.parse('${Applinks.baseurl}/students?search=$query',),
  headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }  );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);controller.update();
      return data['student'].map((json) => Student.fromJson(json)).toList();
      
    } else {
      throw Exception('Failed to load students');
    }
  }
}
