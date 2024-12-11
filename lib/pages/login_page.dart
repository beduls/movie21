import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie21/bloc/cubit/auth_cubit.dart';
import 'package:movie21/utilities/routes/route.dart';
// import 'package:movie21/services/nginfoin/requests/login_request.dart';
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
    return BlocListener<AuthCubit, AuthState>(
      listener: (BuildContext context, state) {
        // print('state : ${state.isLoggedIn}');
        if (state.errMessage.toString() != "") {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text("Gagal Login"),
                    content: Text(state.errMessage.toString()),
                    actions: [
                      FilledButton(
                          onPressed: () {
                            if (context.mounted) {
                              Navigator.pop(context);
                            }
                          },
                          child: const Text("OK kalau begitu"))
                    ],
                  ));
        }
        if (state.isLoggedIn == true) {
          Navigator.pushReplacementNamed(context, AppRoutes.profile);
        }
      },
      listenWhen: (prev, curr) {
        if (prev.isLoggedIn == false && curr.isLoggedIn == true ||
            prev.errMessage == "" && curr.errMessage != "") {
          // print("kalau true1  ${curr.isLoggedIn}");
          return true;
        }
        // print("prev ${prev.errMessage}");
        // print("curr ${curr.errMessage}");
        // print("curr ${curr.isLoggedIn}");
        return false;
        // Navigator.pushReplacementNamed(context, AppRoutes.main);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
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
                    value: "admin@gmail.com",
                    textEditingController: controllerEmail,
                    onChanged: (value) {}),
                QTextField(
                  label: "Password",
                  onChanged: (value) {},
                  obscure: true,
                  suffixIcon: Icons.password,
                  value: "123456",
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
      ),
    );
  }
}
