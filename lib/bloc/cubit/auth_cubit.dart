import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie21/services/nginfoin/models/user_model.dart';
// import 'package:movie21/services/nginfoin/network_nginfoin.dart';
import 'package:movie21/services/nginfoin/requests/login_request.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  Future<void> loginCubit(String email, String password) async {
    emit(state.copyWith(loading: true));

    try {
      final response = await LoginRequest().postLogin(email, password);
      // print(response);
      emit(state.copyWith(loading: false, errMessage: response?.accessToken));
    } catch (err) {
      emit(state.copyWith(loading: false, errMessage: err.toString()));
    }
  }
}
