import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie21/bloc/cubit/auth_cubit.dart';
import 'package:movie21/pages/login_page.dart';
import 'package:movie21/utilities/injector.dart';
import 'package:movie21/utilities/routes/route.dart';
import 'package:movie21/utilities/storeages/auth_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupInjector();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<AuthStorage>()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginPage(title: 'Login'),
        initialRoute: AppRoutes.splash,
        routes: AppRoutes().routes5,
      ),
    );
  }
}
