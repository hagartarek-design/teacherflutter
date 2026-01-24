
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/studentQuestion2.dart';
import 'package:flutterwallet/app/modules/home/views/%D8%A7%D8%AF%D8%A7%D8%B1%D8%A9%20%D8%A7%D9%84%D8%B3%D9%86%D8%AA%D8%B1.dart';
import 'package:flutterwallet/app/modules/home/views/assignments.dart';
import 'package:flutterwallet/app/modules/home/views/home_view.dart';
import 'package:flutterwallet/app/modules/home/views/DashboardScreen2.dart';
import 'package:flutterwallet/app/modules/home/views/lectures.dart';
import 'package:flutterwallet/app/modules/home/views/logoutScreen.dart';
import 'package:flutterwallet/app/modules/home/views/mainscreen.dart';
import 'package:flutterwallet/app/modules/home/views/progress.dart';
import 'package:flutterwallet/app/modules/home/views/DashboardScreen.dart';
import 'package:flutterwallet/app/modules/home/views/settings.dart';
import 'package:flutterwallet/app/modules/home/views/students.dart';
import 'package:flutterwallet/app/modules/home/views/table.dart';
import 'package:get/get.dart';
import 'package:flutterwallet/app/modules/home/views/notifications.dart';
import 'package:flutterwallet/app/modules/home/views/students_questions.dart';

import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/studentQuestion2.dart';
import 'package:flutterwallet/app/modules/home/views/%D8%A7%D8%AF%D8%A7%D8%B1%D8%A9%20%D8%A7%D9%84%D8%B3%D9%86%D8%AA%D8%B1.dart';
import 'package:flutterwallet/app/modules/home/views/assignments.dart';
import 'package:flutterwallet/app/modules/home/views/home_view.dart';
// import 'package:flutterwallet/app/modules/home/views/Quizes.dart';
import 'package:flutterwallet/app/modules/home/views/lectures.dart';
import 'package:flutterwallet/app/modules/home/views/logoutScreen.dart';
import 'package:flutterwallet/app/modules/home/views/mainscreen.dart';
import 'package:flutterwallet/app/modules/home/views/progress.dart';
import 'package:flutterwallet/app/modules/home/views/DashboardScreen.dart';
import 'package:flutterwallet/app/modules/home/views/settings.dart';
import 'package:flutterwallet/app/modules/home/views/students.dart';
import 'package:flutterwallet/app/modules/home/views/table.dart';
import 'package:get/get.dart';
import 'package:flutterwallet/app/modules/home/views/notifications.dart';
import 'package:flutterwallet/app/modules/home/views/students_questions.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/studentQuestion2.dart';
import 'package:flutterwallet/app/modules/home/views/%D8%A7%D8%AF%D8%A7%D8%B1%D8%A9%20%D8%A7%D9%84%D8%B3%D9%86%D8%AA%D8%B1.dart';
import 'package:flutterwallet/app/modules/home/views/assignments.dart';
import 'package:flutterwallet/app/modules/home/views/home_view.dart';
// import 'package:flutterwallet/app/modules/home/views/Quizes.dart';
import 'package:flutterwallet/app/modules/home/views/lectures.dart';
import 'package:flutterwallet/app/modules/home/views/logoutScreen.dart';
import 'package:flutterwallet/app/modules/home/views/mainscreen.dart';
import 'package:flutterwallet/app/modules/home/views/progress.dart';
import 'package:flutterwallet/app/modules/home/views/DashboardScreen.dart';
import 'package:flutterwallet/app/modules/home/views/settings.dart';
import 'package:flutterwallet/app/modules/home/views/students.dart';
import 'package:flutterwallet/app/modules/home/views/table.dart';
import 'package:get/get.dart';
import 'package:flutterwallet/app/modules/home/views/notifications.dart';
import 'package:flutterwallet/app/modules/home/views/students_questions.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class rightbar extends StatefulWidget {
  const rightbar({super.key});

  @override
  State<rightbar> createState() => _rightbarState();
}

bool clicked = false;
bool sections = false;
bool assignments = false;
bool onlinestudents = false;
bool students = false;
bool home = false;
bool tables = false;
bool bankques = false;
bool centermanage = false;
bool studentsques = false;
bool notifications = false;
bool settings = false;
bool orders = false;
bool logout = false;

class _rightbarState extends State<rightbar> {
  final HomeController controller = Get.find<HomeController>();
  Widget _buildButtonmain({
  required String text,
  required IconData icon,
  required String route,
  bool isActive = false,
}) {
  final HomeController controller = Get.find<HomeController>();
  
  return SizedBox(
    width: 247.0,
    height: 48.0,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? Colors.white : Color.fromARGB(235, 6, 69, 152),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      onPressed: () {
        // استخدام smartNavigate الذكي
        controller.smartNavigate(route);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: isActive ? Colors.blue[900] : Colors.white,
            ),
          ),
          SizedBox(width: 16),
          Icon(icon, color: isActive ? Colors.blue[900] : Colors.white),
        ],
      ),
    ),
  );
}
// final HomeController controller = Get.find<HomeController>();
  Widget _buildButton({
    required String text,
    required IconData icon,
    required String route,
    bool isActive = false,
  }) {
    return SizedBox(
      width: 247.0,
      height: 48.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? Colors.white : Color.fromARGB(235, 6, 69, 152),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () => _navigate(route),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: isActive ? Colors.blue[900] : Colors.white,
              ),
            ),
            SizedBox(width: 16),
            Icon(icon, color: isActive ? Colors.blue[900] : Colors.white),
          ],
        ),
      ),
    );
  }
  // دالة مشتركة للانتقال
  Future<void> _navigate(String routeName) async {
    try {
      print('🔄 الانتقال إلى: $routeName');
      
      // استخدام smartNavigate الذكي
      await controller.smartNavigate(routeName);
      
    } catch (e) {
      print('❌ خطأ في الانتقال: $e');
    }
  }
  
  // معالجة الخروج
  Future<void> _handleLogout() async {
    print('👤 بدء عملية الخروج');
    
    // أظهر تأكيد للمستخدم
    Get.defaultDialog(
      title: 'تأكيد الخروج',
      middleText: 'هل أنت متأكد من الخروج من التطبيق؟',
      textConfirm: 'نعم، أخرج',
      textCancel: 'إلغاء',
      confirmTextColor: Colors.white,
      onConfirm: () async {
        Get.back();
        print('✅ المستخدم أكد الخروج');
        await controller.logout();
      },
      onCancel: () {
        print('🚫 إلغاء الخروج');
      },
    );
  }
// في _navigateWithTokenCheck في rightbar
Future<void> _navigateWithTokenCheck(String routeName,  setStateCallback) async {
  try {
    print('🔄 الانتقال إلى: $routeName');
    
    final currentRoute = Get.currentRoute;
    print('📍 أنت في: $currentRoute');
    
    // تحديث حالة الأزرار
    if (mounted) {
      setState(setStateCallback);
    }
    
    // استخدام الدالة الذكية مع التحقق
    // await controller.smartNavigateWithCheck(routeName);
    
    print('✅ تم الانتقال');
    
  } catch (e) {
    print('❌ خطأ: $e');
  }
}// دالة مساعدة للحصول على المسار الحالي
Future<String> _getSafeCurrentRoute() async {
  try {
    String route = Get.currentRoute;
    if (route.isNotEmpty) return route;
    
    // إذا كان فارغاً، حاول مرة أخرى بعد تأخير
    await Future.delayed(Duration(milliseconds: 100));
    route = Get.currentRoute;
    return route;
  } catch (e) {
    print('⚠️ خطأ في الحصول على المسار الحالي: $e');
    return '';
  }
} void handleLogout(BuildContext context) async {
    // أولاً، تأكد من إغلاق Dashboard
    controller.isDashboardOpen.value = false;
    
    // تأخير بسيط قبل تسجيل الخروج
    await Future.delayed(Duration(milliseconds: 100));
    
    // الآن سجل الخروج
    await controller.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header مع Logo
        Container(
          width: 280,
          height: 157,
          child: Image.asset(
            '3lmnasa.png',
            height: 118,
            width: 153.11,
          ),
        ),
        
        // قائمة الأزرار
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                width: 279.0,
                height: 1008.0,
                child: Column(
                  children: [
                    Container(width: 279, height: 72),
                    
                    // زر الرئيسية
               _buildButtonmain(
                      text: 'الرئيسية',
                      icon: Icons.home,
                      route: '/Mainscreen',
                      isActive: Get.currentRoute == '/Mainscreen',
                    ),
                    SizedBox(height: 10),
                    
                    // زر Dashboard
                    _buildButton(
                      text: 'المحاضرات',
                      icon: Icons.dashboard,
                      route: '/DashboardScreen',
                      
                      isActive: Get.currentRoute.contains('Dashboard'),
                    ),
                    SizedBox(height: 10),
                    
                    // زر الامتحانات
                    SizedBox(
                      width: 247.0,
                      height: 48.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor: sections
                              ? Colors.white
                              : Color.fromARGB(235, 6, 69, 152),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () async {
                          await _navigateWithTokenCheck('/DashboardScreen2', () {
                            clicked = false;
                            sections = true;
                            assignments = false;
                            onlinestudents = false;
                            students = false;
                            home = false;
                            tables = false;
                            bankques = false;
                            centermanage = false;
                            studentsques = false;
                            notifications = false;
                            settings = false;
                            orders = false;
                            logout = false;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'الامتحانات',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color.fromARGB(181, 154, 175, 228),
                              ),
                            ),
                            SizedBox(width: 16),
                            Image.asset(
                              'icons/Component2.png',
                              width: 17.81,
                              height: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    
                    // زر الواجبات
                    SizedBox(
                      width: 247.0,
                      height: 48.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor: assignments
                              ? Colors.white
                              : Color.fromARGB(235, 6, 69, 152),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () async {
                          await _navigateWithTokenCheck('/Assignments', () {
                            clicked = false;
                            sections = false;
                            assignments = true;
                            onlinestudents = false;
                            students = false;
                            home = false;
                            tables = false;
                            bankques = false;
                            centermanage = false;
                            studentsques = false;
                            notifications = false;
                            settings = false;
                            orders = false;
                            logout = false;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'الواجبات',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color.fromARGB(181, 154, 175, 228),
                              ),
                            ),
                            SizedBox(width: 16),
                            Image.asset(
                              'icons/Component3.png',
                              width: 19.06,
                              height: 22.15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    
                    // زر الطلاب
                    SizedBox(
                      width: 247.0,
                      height: 48.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          backgroundColor: students
                              ? Colors.white
                              : Color.fromARGB(235, 6, 69, 152),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () async {
                          await _navigateWithTokenCheck('/Students', () {
                            clicked = false;
                            sections = false;
                            assignments = false;
                            onlinestudents = false;
                            students = true;
                            home = false;
                            tables = false;
                            bankques = false;
                            centermanage = false;
                            studentsques = false;
                            notifications = false;
                            settings = false;
                            orders = false;
                            logout = false;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'الطلاب',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 25 / 14,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color.fromARGB(181, 154, 175, 228),
                              ),
                            ),
                            SizedBox(width: 16),
                            Image.asset(
                              'icons/Group3.png',
                              width: 21.67,
                              height: 22.15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    
                    // زر جدول
                    SizedBox(
                      width: 247.0,
                      height: 48.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          backgroundColor: tables
                              ? Colors.white
                              : Color.fromARGB(235, 6, 69, 152),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () async {
                          await _navigateWithTokenCheck('/table', () {
                            clicked = false;
                            sections = false;
                            assignments = false;
                            onlinestudents = false;
                            students = false;
                            home = false;
                            tables = true;
                            bankques = false;
                            centermanage = false;
                            studentsques = false;
                            notifications = false;
                            settings = false;
                            orders = false;
                            logout = false;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'جدول',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color.fromARGB(181, 154, 175, 228),
                              ),
                            ),
                            SizedBox(width: 16),
                            Image.asset(
                              'icons/Vector1.png',
                              width: 21.67,
                              height: 22.15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    
                    // زر بنك الأسئلة
                    SizedBox(
                      width: 247.0,
                      height: 48.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          backgroundColor: bankques
                              ? Colors.white
                              : Color.fromARGB(235, 6, 69, 152),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () async {
                          await _navigateWithTokenCheck('/Lectures', () {
                            clicked = false;
                            sections = false;
                            assignments = false;
                            onlinestudents = false;
                            students = false;
                            home = false;
                            tables = false;
                            bankques = true;
                            centermanage = false;
                            studentsques = false;
                            notifications = false;
                            settings = false;
                            orders = false;
                            logout = false;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'بنك الأسئلة',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color.fromARGB(181, 154, 175, 228),
                              ),
                            ),
                            SizedBox(width: 16),
                            Image.asset(
                              'icons/Group4.png',
                              width: 22.59,
                              height: 21.98,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    
                    // زر إدارة السنتر
                    SizedBox(
                      width: 247.0,
                      height: 48.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          backgroundColor: centermanage
                              ? Colors.white
                              : Color.fromARGB(235, 6, 69, 152),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () async {
                          await _navigateWithTokenCheck('/managecenter', () {
                            clicked = false;
                            sections = false;
                            assignments = false;
                            onlinestudents = false;
                            students = false;
                            home = false;
                            tables = false;
                            bankques = false;
                            centermanage = true;
                            studentsques = false;
                            notifications = false;
                            settings = false;
                            orders = false;
                            logout = false;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'إدارة السنتر',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color.fromARGB(181, 154, 175, 228),
                              ),
                            ),
                            SizedBox(width: 16),
                            Image.asset(
                              'icons/Vector1.png',
                              width: 21.67,
                              height: 22.15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    
                    // زر أسئلة الطلاب
                    SizedBox(
                      width: 247.0,
                      height: 48.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          backgroundColor: studentsques
                              ? Colors.white
                              : Color.fromARGB(235, 6, 69, 152),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () async {
                          // جلب الأسئلة أولاً
                          await controller.fetchQuestions();
                          
                          List<int> studentLengths = controller.questions
                              .map((question) => question.students?.length ?? 0)
                              .toList();
                          
                          print('📊 عدد الطلاب في الأسئلة: ${studentLengths}');
                          
                          // ثم الانتقال للصفحة
                          await _navigateWithTokenCheck('/StudentsQuestions', () {
                            clicked = false;
                            sections = false;
                            assignments = false;
                            onlinestudents = false;
                            students = false;
                            home = false;
                            tables = false;
                            bankques = false;
                            centermanage = false;
                            studentsques = true;
                            notifications = false;
                            settings = false;
                            orders = false;
                            logout = false;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'أسئلة الطلاب',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color.fromARGB(181, 154, 175, 228),
                              ),
                            ),
                            SizedBox(width: 16),
                            Image.asset(
                              'icons/Vector1.png',
                              width: 21.67,
                              height: 22.15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    
                    // زر الإشعارات
                    SizedBox(
                      width: 247.0,
                      height: 48.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          backgroundColor: notifications
                              ? Colors.white
                              : Color.fromARGB(235, 6, 69, 152),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () async {
                          await _navigateWithTokenCheck('/Notifications', () {
                            clicked = false;
                            sections = false;
                            assignments = false;
                            onlinestudents = false;
                            students = false;
                            home = false;
                            tables = false;
                            bankques = false;
                            centermanage = false;
                            studentsques = false;
                            notifications = true;
                            settings = false;
                            orders = false;
                            logout = false;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'الإشعارات',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color.fromARGB(181, 154, 175, 228),
                              ),
                            ),
                            SizedBox(width: 16),
                            Image.asset(
                              'icons/Vector1.png',
                              width: 21.67,
                              height: 22.15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    
                    // زر الإعدادات
                    SizedBox(
                      width: 247.0,
                      height: 48.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          backgroundColor: settings
                              ? Colors.white
                              : Color.fromARGB(235, 6, 69, 152),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () async {
                          await _navigateWithTokenCheck('/Settings', () {
                            clicked = false;
                            sections = false;
                            assignments = false;
                            onlinestudents = false;
                            students = false;
                            home = false;
                            tables = false;
                            bankques = false;
                            centermanage = false;
                            studentsques = false;
                            notifications = false;
                            settings = true;
                            orders = false;
                            logout = false;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'الإعدادات',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color.fromARGB(181, 154, 175, 228),
                              ),
                            ),
                            SizedBox(width: 16),
                            Image.asset(
                              'icons/Vector1.png',
                              width: 21.67,
                              height: 22.15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    
                    // زر الطلبات
                    SizedBox(
                      width: 247.0,
                      height: 48.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          backgroundColor: orders
                              ? Colors.white
                              : Color.fromARGB(235, 6, 69, 152),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () async {
                          await _navigateWithTokenCheck('/LogOut', () {
                            clicked = false;
                            sections = false;
                            assignments = false;
                            onlinestudents = false;
                            students = false;
                            home = false;
                            tables = false;
                            bankques = false;
                            centermanage = false;
                            studentsques = false;
                            notifications = false;
                            settings = false;
                            orders = true;
                            logout = false;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'الطلبات',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color.fromARGB(181, 154, 175, 228),
                              ),
                            ),
                            SizedBox(width: 16),
                            Image.asset(
                              'icons/Vector1.png',
                              width: 21.67,
                              height: 22.15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    
                    // زر الخروج
                    SizedBox(
                      width: 247.0,
                      height: 48.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          backgroundColor: logout
                              ? Colors.white
                              : Color.fromARGB(235, 6, 69, 152),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            clicked = false;
                            sections = false;
                            assignments = false;
                            onlinestudents = false;
                            students = false;
                            home = false;
                            tables = false;
                            bankques = false;
                            centermanage = false;
                            studentsques = false;
                            notifications = false;
                            settings = false;
                            orders = false;
                            logout = true;
                          });
                          
                          // معالجة تسجيل الخروج
                          handleLogout(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'الخروج',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color.fromARGB(181, 154, 175, 228),
                              ),
                            ),
                            SizedBox(width: 16),
                            Image.asset(
                              'icons/Vector1.png',
                              width: 21.67,
                              height: 22.15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}