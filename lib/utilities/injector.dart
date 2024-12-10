import 'package:get_it/get_it.dart';
import 'package:movie21/services/nginfoin/network_nginfoin.dart';

final getIt = GetIt.instance;

Future<void> setupInjector() async {
  networkInjector();
}

void networkInjector() {
  getIt.registerSingleton(NetworkNginfoin());
  // getIt.registerSingleton(NetworkService(getIt.get()));
  // getIt.registerSingleton(AuthRemoteData(getIt.get()));
  // getIt.registerSingleton(ProductRemoteData(getIt.get()));
  // getIt.registerSingleton(SalesRemoteData(getIt.get()));
}
