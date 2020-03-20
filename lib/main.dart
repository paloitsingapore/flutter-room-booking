import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:room_booking/i18n/app_localization_delegate.dart';

import './pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  // final _localeOverrideDelegate = AppLocalizationDelegate(Locale('en', 'US'));
  final _localeOverrideDelegate = AppLocalizationDelegate(Locale('fr', 'FR'));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        _localeOverrideDelegate
      ],
      supportedLocales: [const Locale('en', 'US'), const Locale('fr', 'FR')],
    );
  }
}
