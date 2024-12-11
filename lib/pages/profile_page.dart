import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie21/bloc/cubit/auth_cubit.dart';
import 'package:movie21/widgets/forms/buttons/button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Column(
            children: [
              Text(state.userModel!.email.toString()),
              QButton(
                  label: "Logout",
                  onPressed: () {
                    print('s');
                  })
            ],
          );
        },
      ),
    );
  }
}
