// import 'package:movie21/pages/homes/home_page.dart';
import 'package:movie21/pages/login_page.dart';
import 'package:movie21/pages/main_page.dart';
import 'package:movie21/pages/profile_page.dart';
import 'package:movie21/pages/splash_page.dart';

class AppRoutes {
  static String get login => "/login";
  static String get splash => "/splash";
  static String get main => "/main";
  static String get profile => "/profile";
}

final routes5 = {
  AppRoutes.login: (context) => const LoginPage(),
  AppRoutes.splash: (context) => const SplashPage(),
  AppRoutes.main: (context) => const MainPage(),
  AppRoutes.profile: (context) => const ProfilePage(),
};
