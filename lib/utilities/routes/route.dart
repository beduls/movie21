import 'package:movie21/pages/login_page.dart';
import 'package:movie21/pages/splash_page.dart';

class AppRoutes {
  static String get login => "/login";
  static String get splash => "/splash";
  static String get main => "/main";

  final routes5 = {
    AppRoutes.login: (context) => const LoginPage(),
    AppRoutes.splash: (context) => const SplashPage(),
  };
}
