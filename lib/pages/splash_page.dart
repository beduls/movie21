import 'package:flutter/material.dart';
import 'package:movie21/utilities/routes/route.dart';
import 'package:movie21/widgets/forms/buttons/button.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      if (context.mounted) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Welcome"),
          QButton(label: "Log Out", onPressed: () {})
        ],
      ),
    );
  }
}
