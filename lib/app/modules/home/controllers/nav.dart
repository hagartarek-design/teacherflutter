import 'package:flutterwallet/app/modules/home/views/assignments%20copy.dart';
import 'package:get/get.dart';

class NavigationService {
  void toLogin() => Get.offAllNamed('/HomeView');
  void toMainScreen() => Get.offAllNamed('/Mainscreen');
  void toDashboard() => Get.offAllNamed('/DashboardScreen');
  void toAssignments() => Get.to(() =>  Assignments2());
  void navigate(String route, {bool replace = true}) {
    if (replace) {
      Get.offAndToNamed(route);
    } else {
      Get.toNamed(route);
    }
  }
}
