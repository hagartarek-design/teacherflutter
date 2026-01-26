import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/routes/app_pages.dart';
import 'package:flutterwallet/firebase_options.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  print(' بدء تشغيل التطبيق');
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDateFormatting('ar', null);

  // وضع Controller
  final controller = Get.put(HomeController());
  print(' HomeController جاهز');

  String initialRoute;
  try {
    initialRoute = await controller.getInitialRoute();
    print(' المسار الأولي: $initialRoute');
  } catch (e) {
    print(' خطأ في المسار الأولي: $e');
    initialRoute = '/HomeView';
  }

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: AppPages.routes,
      routingCallback: (routing) {
        if (routing?.current != null) {
          final time = DateTime.now().toIso8601String().substring(11, 19);
          print('[$time]  ${routing!.current}');
        }
      },
      transitionDuration: Duration(milliseconds: 400),
      defaultTransition: Transition.cupertino,
    ),
  );
  
  print(' التطبيق يعمل');
}