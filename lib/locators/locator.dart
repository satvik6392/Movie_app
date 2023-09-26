import 'package:get_it/get_it.dart';
// import 'package:provider/provider.dart';

import '../provider/movielist_provider.dart';

final getIt = GetIt.instance;
class Locators {
  func() {
    print("coming in locator");
    getIt.registerSingleton<MovieProvider>(MovieProvider());
  }
}
