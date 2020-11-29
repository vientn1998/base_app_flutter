import 'package:base_app_flutter/provider/login_provider.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<LoginProvider>(LoginProvider());
}
