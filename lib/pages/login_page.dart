import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie21/bloc/cubit/auth_cubit.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:movie21/widgets/forms/buttons/button.dart';
import 'package:movie21/widgets/forms/textfields/qtextfield.dart';

class LoginPage extends StatefulWidget {
  final String? title;

  const LoginPage({super.key, this.title});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AuthCubit authCubit;

  @override
  void initState() {
    authCubit = context.read<AuthCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "LOGIN",
                // style: GoogleFonts.alfaSlabOne(fontSize: 30),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
              ),
              const SizedBox(
                height: 20,
              ),
              const QTextField(label: "Email", suffixIcon: Icons.email),
              const QTextField(
                label: "Password",
                obscure: true,
                suffixIcon: Icons.password,
              ),
              BlocBuilder<AuthCubit, AuthState>(
                // jgn lupa buat BlocProvider di main dart
                builder: (context, state) {
                  return QButton(
                      label: "Sign In",
                      sufixIcon: Icons.login,
                      onPressed: () {
                        authCubit.loginCubit("a", "ab");
                        print("ass 22");
                      });
                },
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25),
              //   child: Container(
              //     padding: const EdgeInsets.all(20),
              //     decoration: BoxDecoration(
              //       color: Colors.deepPurple,
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     child: const Center(
              //         child: Text(
              //       'Sign In',
              //       style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 18,
              //           fontWeight: FontWeight.bold),
              //     )),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
