import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:movie21/utilities/storeages/auth_storage.dart';
import 'package:path_provider/path_provider.dart';

final getIt = GetIt.instance;

Future<void> setupInjector() async {
  await hiveInjector();
  localStorageInjector();
  // networkInjector();
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
  // getIt.registerSingleton(NetworkNginfoin());
  // getIt.registerSingleton(NetworkService(getIt.get()));
  // getIt.registerSingleton(AuthRemoteData(getIt.get()));
  // getIt.registerSingleton(ProductRemoteData(getIt.get()));
  // getIt.registerSingleton(SalesRemoteData(getIt.get()));
}
