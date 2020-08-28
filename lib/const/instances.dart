import 'package:flutter/material.dart';
import 'package:flutter_find_funny/utils/utils.dart';

NavigatorState get navigatorState => Instances.navigatorKey.currentState;
BuildContext get currentContext => navigatorState.context;

class Instances {
  Instances._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates =>
      <LocalizationsDelegate<dynamic>>[
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  static Iterable<Locale> get supportedLocales => <Locale>[
        const Locale.fromSubtags(languageCode: 'zh'),
        const Locale.fromSubtags(languageCode: 'en'),
        const Locale('en', ''),
        const Locale('zh', 'CN'),
      ];
}
