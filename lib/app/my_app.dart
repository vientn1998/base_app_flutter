import 'package:base_app_flutter/app/app_localzation.dart';
import 'package:base_app_flutter/blocs/post_bloc.dart';
import 'package:base_app_flutter/constants/app_theme.dart';
import 'package:base_app_flutter/data/network/api_endpoints.dart';
import 'package:base_app_flutter/data/network/api_service.dart';
import 'package:base_app_flutter/data/network/dio_client.dart';
import 'package:base_app_flutter/data/repository.dart';
import 'package:base_app_flutter/screens/splash_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'simple_bloc_delegate.dart';
import 'package:bloc/bloc.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Repository repository;

  @override
  void initState() {
    super.initState();
    this.configNetwork();
    BlocSupervisor.delegate = SimpleBlocDelegate();
    WidgetsFlutterBinding.ensureInitialized();
  }

  configNetwork() {
    final dio = Dio();
    dio
      ..options.baseUrl = EndPoints.baseUrl
      ..options.connectTimeout = EndPoints.connectionTimeout
      ..options.receiveTimeout = EndPoints.receiveTimeout
      ..interceptors.add(LogInterceptor(
        request: false,
        requestBody: false,
        responseBody: false,
        requestHeader: false,
        responseHeader: false,
      ))
      ..interceptors.add(Interceptor(

      ))
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options) {
          //getting token
          options.headers.putIfAbsent("Authorization", () => "token");
        },
      ))
    ;
    DioClient dioClient = DioClient(dio);
    ApiService apiService = ApiService(dioClient);
    repository = Repository(apiService);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(
          create: (context) => PostBloc(repository: this.repository),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: localizationsDelegates,
        theme: themeData,
        supportedLocales: [
          const Locale("vi", "VN"),
          const Locale("en", "US"),
        ],
        home: SplashScreen(),
      ),
    );
  }
}
