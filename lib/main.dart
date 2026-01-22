// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
// import 'package:flutterwallet/app/routes/app_pages.dart';
// import 'package:flutterwallet/firebase_options.dart';
// import 'package:get/get.dart';
// import 'package:intl/date_symbol_data_local.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // تهيئة Firebase
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   // تسجيل Controller على GetX
//   final HomeController controller = Get.put(HomeController());

//   // تهيئة التنسيق العربي للتواريخ
//   await initializeDateFormatting('ar', null);

//   // تحديد الصفحة الأولية حسب التوكن
//   String initialRoute;
//   try {
//     initialRoute = await controller.getInitialRoute();
//   } catch (_) {
//     initialRoute = '/HomeView'; // لو فيه خطأ نرجع لصفحة login
//   }

//   runApp(
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: initialRoute,
//       getPages: AppPages.routes, // هنا كل الصفحات اللي عندك في AppPages
//     ),
//   );
// }
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'home_controller.dart';
// import 'app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final HomeController controller = Get.put(HomeController());
  await initializeDateFormatting('ar', null);
  String initialRoute;
  try {
    initialRoute = await controller.getInitialRoute();
  } catch (_) {
    initialRoute = '/HomeView';
  }

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: AppPages.routes,
    ),
  );
}
