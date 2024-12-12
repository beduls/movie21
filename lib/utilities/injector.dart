import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:movie21/services/nginfoin/network_nginfoin.dart';
import 'package:movie21/services/nginfoin/requests/login_request.dart';
import 'package:movie21/services/nginfoin/responses/product_response.dart';
// import 'package:movie21/services/nginfoin/requests/login_request.dart';
import 'package:movie21/utilities/storeages/auth_storage.dart';
import 'package:path_provider/path_provider.dart';

final getIt = GetIt.instance;

Future<void> setupInjector() async {
  await hiveInjector();
  localStorageInjector();
  networkInjector();
}

Future<void> hiveInjector() async {
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  var box = await Hive.openBox('app');

  getIt.registerSingleton<Box>(box);
}

void localStorageInjector() {
  getIt.registerSingleton(AuthStorage(getIt.get()));
}

void networkInjector() {
  getIt.registerSingleton(NetworkNginfoin(getIt.get()));
  getIt.registerSingleton(LoginRequest(getIt.get()));
  getIt.registerSingleton(ProductResponse(getIt.get()));
}
