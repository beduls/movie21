import 'package:movie21/services/nginfoin/network_nginfoin.dart';
import 'package:movie21/services/nginfoin/responses/login_response.dart';

class LoginRequest {
  late final NetworkNginfoin networkService;

  LoginRequest(this.networkService);

  Future<LoginResponse?> postLogin(String email, String password) async {
    final response = await networkService.post(
        url: "/api/auth/login", data: {"email": email, "password": password});
    return LoginResponse.fromJson(response.data['data']);
  }
}
