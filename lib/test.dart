// // إنشاء ملف: dashboard_container.dart
// import 'package:flutter/material.dart';
// import 'package:flutterwallet/app/modules/home/views/borderright.dart';
// import 'package:get/get.dart';
// import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// // import 'rightbar.dart'; // الشريط الجانبي

// class DashboardContainer extends StatefulWidget {
//   final Widget child;
  
//   const DashboardContainer({Key? key, required this.child}) : super(key: key);

//   @override
//   State<DashboardContainer> createState() => _DashboardContainerState();
// }

// class _DashboardContainerState extends State<DashboardContainer> {
//   final HomeController controller = Get.find<HomeController>();
//   bool _isInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     print('🏠 DashboardContainer - initState');
    
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _initializeDashboard();
//     });
//   }

//   Future<void> _initializeDashboard() async {
//     if (_isInitialized) return;
    
//     print('🔧 تهيئة DashboardContainer');
//     _isInitialized = true;
    
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
    
//     if (token.isEmpty) {
//       print('⚠️ لا يوجد توكن في Container');
//       Get.offAllNamed('/HomeView');
//       return;
//     }
    
//     // بدء التحديث التلقائي
//     controller.startAutoRefresh(token);
    
//     // تحديث حالة Dashboard
//     controller.isDashboardOpen.value = true;
    
//     print('✅ DashboardContainer مهيأ بنجاح');
//   }

//   @override
//   void dispose() {
//     print('❌ DashboardContainer - dispose');
    
//     // فقط إذا لم ننتقل إلى Dashboard آخر
//     if (!Get.currentRoute.contains('Dashboard')) {
//       controller.isDashboardOpen.value = false;
//     }
    
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           // الشريط الجانبي
//           Container(
//             width: 280,
//             height: double.infinity,
//             child: rightbar(),
//           ),
//           // المحتوى
//           Expanded(
//             child: widget.child,
//           ),
//         ],
//       ),
//     );
//   }
// }