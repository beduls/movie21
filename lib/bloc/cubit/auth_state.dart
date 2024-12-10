part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final UserModel? userModel;
  final bool? loading;
  final String? errMessage;
  final bool? isLoggedIn;

  const AuthState({
    this.userModel,
    this.loading,
    this.errMessage,
    this.isLoggedIn,
  });

  AuthState copyWith({
    UserModel? userModel,
    bool? loading,
    String? errMessage,
    bool? isLoggedIn,
  }) =>
      AuthState(
        userModel: userModel ?? this.userModel,
        loading: loading ?? this.loading,
        errMessage: errMessage ?? this.errMessage,
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      );

  @override
  List<Object?> get props => [
        userModel,
        loading,
        errMessage,
        isLoggedIn,
      ];
}
