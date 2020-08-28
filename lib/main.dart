import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_find_funny/components/no_route_page.dart';
import 'package:flutter_find_funny/components/no_splash_factory.dart';
import 'package:flutter_find_funny/const/colors.dart';
import 'package:flutter_find_funny/const/instances.dart';
import 'package:flutter_find_funny/pages/splash_page.dart';
import 'package:flutter_find_funny/providers/providers.dart';
import 'package:flutter_find_funny/utils/sp_util.dart';
import 'package:flutter_find_funny/utils/utils.dart';
import 'package:provider/provider.dart';
import 'flutter_find_funny_route_helper.dart';
import 'package:amap_core_fluttify/amap_core_fluttify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.initSp();
  await AmapCore.init('16706815413941477f51cbd5b7af7a58');

  /// Android 状态栏透明
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: '发现有趣',
        theme: ThemeData(
          // primarySwatch: Colors.blue,
          primaryColor: kAppC,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          highlightColor: Colors.transparent,
          splashFactory: const NoSplashFactory(),
        ),
        debugShowCheckedModeBanner: false,
        navigatorKey: Instances.navigatorKey,
        navigatorObservers: <NavigatorObserver>[FFNavigatorObserver()],
        onGenerateRoute: (RouteSettings routeSettings) {
          return onGenerateRouteHelper(
            routeSettings,
            notFoundFallback: NoRoutePage(route: routeSettings.name),
          );
        },
        localizationsDelegates: Instances.localizationsDelegates,
        supportedLocales: Instances.supportedLocales,
        builder: (BuildContext ctx, Widget child) {
          ScreenUtil.init(ctx,
              width: 750, height: 1334, allowFontScaling: false);
          return Material(
            child: FlutterEasyLoading(child: child),
          );
        },
        home: SplashPage(),
      ),
    );
  }
}
