import 'package:flutterwallet/app/modules/home/views/%D8%A7%D8%AF%D8%A7%D8%B1%D8%A9%20%D8%A7%D9%84%D8%B3%D9%86%D8%AA%D8%B1.dart';
import 'package:flutterwallet/app/modules/home/views/askquestion.dart';
import 'package:flutterwallet/app/modules/home/views/dialogs/dialog_quizes.dart';
// import 'package:flutterwallet/app/modules/home/views/dialog_quizes.dart';
import 'package:flutterwallet/app/modules/home/views/lectures.dart';
import 'package:flutterwallet/app/modules/home/views/logoutScreen.dart';
import 'package:flutterwallet/app/modules/home/views/mainscreen.dart';
import 'package:flutterwallet/app/modules/home/views/home_view.dart';
import 'package:flutterwallet/app/modules/home/views/DashboardScreen.dart';
import 'package:flutterwallet/app/modules/home/views/notifications.dart';
import 'package:flutterwallet/app/modules/home/views/quizes.dart';
import 'package:flutterwallet/app/modules/home/views/settings.dart';
import 'package:flutterwallet/app/modules/home/views/students.dart';
import 'package:flutterwallet/app/modules/home/views/students_questions.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/Assignments.dart';
import '../modules/home/views/table.dart';
// import '../modules/home/modules/assignments.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = '/HomeView';

  static final routes = [
    GetPage(
      name: '/HomeView', 
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/Mainscreen', 
      page: () => Mainscreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/DashboardScreen', 
      page: () => DashboardScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/quizes', 
      page: () => quizes(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/Assignments', 
      page: () => Assignments(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/Settings', 
      page: () => Settings(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/Students', 
      page: () => Students(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/table', 
      page: () => table(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/Lectures', 
      page: () => Lectures(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/managecenter', 
      page: () => managecenter(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/StudentsQuestions', 
      page: () => StudentsQuestions(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/Notifications', 
      page: () => Notifications(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/LogOut', 
      page: () => LogOut(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/dialogquizes', 
      page: () => dialogquizes(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/askquestion', 
      page: () => Askquestion(),
      binding: HomeBinding(),
    ),
  ];
}