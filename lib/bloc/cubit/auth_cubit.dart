import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie21/services/nginfoin/models/user_model.dart';
// import 'package:movie21/services/nginfoin/network_nginfoin.dart';
import 'package:movie21/services/nginfoin/requests/login_request.dart';
import 'package:movie21/utilities/storeages/auth_storage.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  late final AuthStorage authStorage;
  late final LoginRequest loginRequest;
  AuthCubit(this.authStorage, this.loginRequest) : super(const AuthState());

  Future<void> loginCubit(String email, String password) async {
    emit(state.copyWith(loading: true, isLoggedIn: false));

    try {
      final response = await loginRequest.postLogin(email, password);
      emit(state.copyWith(
          userModel: response?.user,
          loading: false,
          isLoggedIn: true,
          token: response?.accessToken,
          errMessage: ""));
      await authStorage.setToken(response!.accessToken.toString());
      await authStorage.setUser(response.user);
    } catch (err) {
      emit(state.copyWith(loading: false, errMessage: "$err"));
    }
  }

  bool isLoggedIn() {
    final token = authStorage.getToken();
    final user5 = authStorage.getUser();
    if (token?.isEmpty ?? true) {
      return false;
    }
    emit(state.copyWith(loading: false, userModel: user5, isLoggedIn: true));
    return true;
  }

  Future<void> logoutCubit() async {
    emit(state.copyWith(
      userModel: null,
      isLoggedIn: false,
      token: "",
    ));
    await authStorage.clearBox();
    // print("login gak = ${state.isLoggedIn}");
  }
}
