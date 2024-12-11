import 'package:hive/hive.dart';
import 'package:movie21/services/nginfoin/models/user_model.dart';

class AuthStorage {
  late final Box box;

  AuthStorage(this.box);

  Future<void> setToken(String value) async {
    await box.put('token', value);
  }

  String? getToken() {
    return box.get('token');
  }

  Future<void> setUser(UserModel value) async {
    // await box.put('user', value.toJson());
    await box.put('name', value.name);
    await box.put('email', value.email);
  }

  Future<void> clearToken() async {
    await box.delete('nama');
    await box.delete('email');
    await box.delete('token');
  }

  UserModel? getUser() {
    // final result = box.get('user');
    final name = box.get('name');
    final email = box.get('email');
    if (name != null) {
      return UserModel(name: name, email: email, id: 1);
      // return Users.fromJson(result);
    }
    return null;
  }

  Future<void> clearBox() async {
    await box.delete('token');
    await box.delete('name');
    await box.delete('email');
  }
}
