part of 'app_pages.dart';

// part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const MAINSCREEN = _Paths.MAINSCREEN;
  static const DASHBOARD_SCREEN = _Paths.DASHBOARD_SCREEN;
  static const DASHBOARD_SCREEN_2 = _Paths.DASHBOARD_SCREEN_2;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const MAINSCREEN = '/Mainscreen';
  static const DASHBOARD_SCREEN = '/DashboardScreen';
  static const DASHBOARD_SCREEN_2 = '/DashboardScreen2';
}
