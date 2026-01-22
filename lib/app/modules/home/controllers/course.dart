import 'package:get/get.dart';

class CourseController extends GetxController {
  RxList<CourseAttend2> courseAttends = <CourseAttend2>[].obs;
  RxBool isLoading = false.obs;
  int currentPage = 1;
  final int pageSize = 10;

  // Simulate API call to fetch paginated data
  Future<void> fetchCourseAttends({bool isLoadMore = false}) async {
    if (isLoading.value) return;

    isLoading.value = true;

    try {
      // Simulate API response delay
      await Future.delayed(Duration(seconds: 2));

      // Generate mock data with the new fields
      final fetchedData = List.generate(pageSize, (index) {
        int itemIndex = (currentPage - 1) * pageSize + index + 1;
        return CourseAttend2.fromJson({
          "id": itemIndex,
          "month": "Month $itemIndex",
          "days": "${itemIndex * 2} days",
          "seen_amount": itemIndex * 1.5,
          "pay_amount": itemIndex * 10.0,
        });
      });

      if (isLoadMore) {
        courseAttends.addAll(fetchedData);
      } else {
        courseAttends.value = fetchedData;
      }

      currentPage++;
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class CourseAttend2 {
  int? id;
  String? month;
  String? days;
  double? seenAmount;
  double? payAmount;

  CourseAttend2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    month = json['month'];
    days = json['days'];
    seenAmount = json['seen_amount'].toDouble();
    payAmount = json['pay_amount'].toDouble();
  }
}
