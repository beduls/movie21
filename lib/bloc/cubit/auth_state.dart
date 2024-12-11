part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final UserModel? userModel;
  final bool? loading;
  final String? errMessage;
  final bool? isLoggedIn;
  final String? token;

  const AuthState(
      {this.userModel,
      this.loading,
      this.errMessage,
      this.isLoggedIn,
      this.token});

  AuthState copyWith({
    UserModel? userModel,
    bool? loading,
    String? errMessage,
    bool? isLoggedIn,
    String? token,
  }) =>
      AuthState(
        userModel: userModel ?? this.userModel,
        loading: loading ?? this.loading,
        errMessage: errMessage ?? this.errMessage,
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
        token: token ?? this.token,
      );

  @override
  List<Object?> get props =>
      [userModel, loading, errMessage, isLoggedIn, token];
}
