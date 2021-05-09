import 'package:get_it/get_it.dart';

import 'data_toto_repo.dart';

GetIt locator = GetIt.instance;

setupLocatorClients() {
  locator.registerLazySingleton(() => DataToDoRepository());
}
