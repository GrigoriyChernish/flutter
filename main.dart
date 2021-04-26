import 'package:flutter/material.dart';
import 'package:flutter_app/pages/MainPage.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'pages/Auth/AuthPage.dart';
import 'style/MainStyle.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;

  runApp(StartApp());
}

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        return locale;
      },
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (BuildContext context) => S.of(context).title,
      theme: StyleTheme.light,
      home: AuthPage(),
    );
  }
}
