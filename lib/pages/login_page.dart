import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie21/bloc/cubit/auth_cubit.dart';
import 'package:movie21/services/nginfoin/requests/login_request.dart';
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
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

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
              QTextField(
                  label: "Email",
                  suffixIcon: Icons.email,
                  textEditingController: controllerEmail,
                  onChanged: (value) {}),
              QTextField(
                label: "Password",
                onChanged: (value) {},
                obscure: true,
                suffixIcon: Icons.password,
                textEditingController: controllerPassword,
              ),
              BlocBuilder<AuthCubit, AuthState>(
                // jgn lupa buat BlocProvider di main dart
                builder: (context, state) {
                  return QButton(
                      label: "Sign In",
                      sufixIcon: Icons.login,
                      onPressed: () {
                        authCubit.loginCubit(
                            controllerEmail.text, controllerPassword.text);
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
