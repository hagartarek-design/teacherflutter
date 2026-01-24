import 'package:flutterwallet/app/modules/home/views/mainscreen.dart';
import 'package:flutterwallet/app/modules/home/views/home_view.dart';
import 'package:flutterwallet/app/modules/home/views/DashboardScreen.dart';
import 'package:flutterwallet/app/modules/home/views/DashboardScreen2.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';

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
      name: '/DashboardScreen2', 
      page: () => DashboardScreen2(),
      binding: HomeBinding(),
    ),
  ];
}