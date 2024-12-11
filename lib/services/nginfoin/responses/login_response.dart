import 'package:movie21/services/nginfoin/models/user_model.dart';

class LoginResponse {
  UserModel user;
  String accessToken;
  String tokenType;
  int expiresIn;

  LoginResponse({
    required this.user,
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        user: UserModel.fromJson(json["user"]),
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}
