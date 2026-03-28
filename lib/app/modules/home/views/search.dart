
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/search_controller.dart';
import 'package:get/get.dart';
// import 'package';
class StudentSearchScreen extends StatelessWidget {
  final String studentId;

  const StudentSearchScreen({Key? key, required this.studentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchController2(studentId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Courses'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                controller.searchQuery.value = value;
                debounce(
controller.obs,(c)=>c.searchCourses(),
                  time: const Duration(milliseconds: 500),
                );
              },
              decoration: InputDecoration(
                hintText: 'Search by name, phone or email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Obx(() => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    itemCount: controller.searchResults.length,
                    itemBuilder: (context, index) {
                      final course = controller.searchResults[index];
                      return ListTile(
                        title: Text(course['name'] ?? 'No name'),
                        subtitle: Text(course['description'] ?? ''),
                      );
                    },
                  ),
                ),
          ),
        ],
      ),
    );
  }
//  @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

}