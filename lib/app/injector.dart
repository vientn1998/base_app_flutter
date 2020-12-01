import 'package:base_app_flutter/data/services/api_base.dart';
import 'package:base_app_flutter/provider/login_provider.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<BaseApi>(BaseApi());
  getIt.registerSingleton<LoginProvider>(LoginProvider());
}
