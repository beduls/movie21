import 'package:movie21/services/nginfoin/network_nginfoin.dart';
import 'package:movie21/services/nginfoin/responses/login_response.dart';

class LoginRequest {
  LoginRequest();

  Future<LoginResponse?> postLogin(String email, String password) async {
    final response = await NetworkNginfoin().post(
        url: "/api/auth/login", data: {"email": email, "password": password});
    return LoginResponse.fromJson(response.data['data']);
  }
}
