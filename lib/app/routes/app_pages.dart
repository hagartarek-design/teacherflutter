import 'package:flutterwallet/app/modules/home/views/mainscreen.dart';
import 'package:flutterwallet/app/modules/home/views/sections.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = '/HomeView';

  static final routes = [
    GetPage(name: '/HomeView', page: () => HomeView()),
    GetPage(name: '/Mainscreen', page: () => Mainscreen()),
    GetPage(name: '/DashboardScreen', page: () => DashboardScreen()),
  ];
}
