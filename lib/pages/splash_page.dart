import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie21/bloc/cubit/auth_cubit.dart';
import 'package:movie21/utilities/routes/route.dart';
// import 'package:movie21/widgets/forms/buttons/button.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 1), () {
    //   if (context.mounted) {
    //     // ignore: use_build_context_synchronously
    //     Navigator.pushReplacementNamed(context, AppRoutes.login);
    //   }
    // });
    checkLogin();
    super.initState();
  }

  void checkLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      final isLogin = context.read<AuthCubit>().isLoggedIn();
      if (isLogin == true) {
        Navigator.pushReplacementNamed(context, AppRoutes.main);
        // Navigator.pushReplacementNamed(context, AppRoutes.profile);
      } else {
        // Navigator.pushReplacementNamed(context, AppRoutes.login);
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.login, (Route<dynamic> route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome"),
            Text("Welcome2"),
          ],
        ),
      ),
    );
  }
}
