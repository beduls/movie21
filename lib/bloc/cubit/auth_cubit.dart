import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie21/services/nginfoin/models/user_model.dart';
// import 'package:movie21/services/nginfoin/network_nginfoin.dart';
import 'package:movie21/services/nginfoin/requests/login_request.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  Future<void> loginCubit(String email, String password) async {
    emit(state.copyWith(loading: true, isLoggedIn: false));

    try {
      final response = await LoginRequest().postLogin(email, password);
      emit(state.copyWith(
          userModel: response?.user,
          loading: false,
          isLoggedIn: true,
          errMessage: ""));
    } catch (err) {
      emit(state.copyWith(loading: false, errMessage: "$err"));
    }
  }

  Future<void> logoutCubit() async {
    // print('as');
    emit(state.copyWith(
      userModel: null,
      isLoggedIn: false,
    ));
    print("login gak = ${state.isLoggedIn}");
  }
}
