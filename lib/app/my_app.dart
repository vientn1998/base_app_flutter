import 'dart:async';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:base_app_flutter/app/app_localzation.dart';
import 'package:base_app_flutter/blocs/post_bloc.dart';
import 'package:base_app_flutter/constants/app_theme.dart';
import 'package:base_app_flutter/data/network/api_endpoints.dart';
import 'package:base_app_flutter/data/network/api_service.dart';
import 'package:base_app_flutter/data/network/dio_client.dart';
import 'package:base_app_flutter/data/repository.dart';
import 'package:base_app_flutter/screens/splash_screen.dart';
import 'package:base_app_flutter/utils/dialog_utils.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'simple_bloc_delegate.dart';
import 'package:bloc/bloc.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{

  Repository repository;
  bool isConnected = true;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> streamController;

  int countBack = 0;
  @override
  void initState() {
    super.initState();
    this.configAPIService();
    WidgetsBinding.instance.addObserver(this);
    BlocSupervisor.delegate = SimpleBlocDelegate();
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("LifecycleApp: ${state.toString()}");
    switch (state) {
      case AppLifecycleState.resumed:
        countBack = 0;
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    isConnected = await checkConnectivity();
    if (!isConnected) {
      showDialogNoInternet();
    }
    streamController = _connectivity.onConnectivityChanged.listen((event) {
      countBack = 0;
      if (isConnected) {
        if (event == ConnectivityResult.none) {
          print("listen: $event");
          isConnected = false;
          showDialogNoInternet();
        }
      } else {
        if (event != ConnectivityResult.none) {
          print("listen: $event");
          isConnected = true;
          Get.back();
        }
      }
    });
  }

  configAPIService() {
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
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    try{
      streamController.cancel();
    } catch(ex) {
      print("ex: ${ex.toString()}");
    } finally{
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(
          create: (context) => PostBloc(repository: this.repository),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: localizationsDelegates,
        theme: AppTheme.themeData,
        supportedLocales: [
          const Locale("vi", "VN"),
          const Locale("en", "US"),
        ],
        home: SplashScreen(),
      ),
    );
  }

  showDialogNoInternet() async{
    return Get.generalDialog(
      pageBuilder: (context, animation, secondaryAnimation) {
        return WillPopScope(
          onWillPop: () async {
            countBack += 1;
            print("count $countBack");
            if (countBack == 2) {
              print("exist app");
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            } else {
              if (Platform.isAndroid) {
                DialogUtils.showToast(message: "Tap gain to back");
              }
            }
            return false;
          },
          child: AlertDialog(
            title: new Text("Alert Dialog title"),
            content: new Text("Alert Dialog body"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Setting"),
                onPressed: () {
                  AppSettings.openWIFISettings();
                },
              ),
            ],
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: false,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return Transform.scale(
          scale: animation.value,
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        );
      },
    );
  }

  Future<bool> checkConnectivity() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return true;
    }
    return false;
  }
}
