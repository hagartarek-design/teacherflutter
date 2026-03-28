import 'dart:convert';
import 'package:http/http.dart'as http;
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController2 extends GetxController {
  final String studentId;
  SearchController2(this.studentId);

  final RxList<dynamic> searchResults = <dynamic>[].obs;
  final RxBool isLoading = false.obs;
  final searchQuery = ''.obs;

  Future<void> searchCourses() async {
    if (searchQuery.value.isEmpty) {
      searchResults.value = [];
      return;
    }

    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse('http://localhost:3300/courses/bystudent/$studentId?name=${searchQuery.value}&phoneNum=${searchQuery.value}&email=${searchQuery.value}'),
      );

      if (response.statusCode == 200) {
        searchResults.value = json.decode(response.body);
  
  Get.snackbar('Success', 'message');
      } else {
        Get.snackbar('Error', 'Failed to load search results');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}