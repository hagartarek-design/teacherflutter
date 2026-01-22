part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const DashboardScreen2 = _Paths.DashboardScreen;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const DashboardScreen = '/DashboardScreen';
}
