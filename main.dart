import 'package:flutter/material.dart';
import 'model/notifications.dart';
import 'pages/MainPage.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:provider/provider.dart';
import 'model/auth/authModel.dart';
import 'pages/Auth/AuthPage.dart';
import 'style/MainStyle.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(App());
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Authentication()),
        ChangeNotifierProvider(create: (_) => Notify()),
      ],
      child: Consumer<Notify>(
        builder: (_, notify, __) {
          print('notify logged in: ${notify.status}');
          return StartApp();
        },
      ),
    );
  }
}

class StartApp extends StatefulWidget {
  @override
  _StartAppState createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localeResolutionCallback: (Locale? locale, Iterable<Locale> supportedLocales) {
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
      home: Consumer<Authentication>(
        builder: (_, auth, __) {
          // print('main.dart logged in: ${auth.status}');
          if (auth.status == AuthStatus.authenticated) {
            return MainPage();
          }
          return AuthPage();
        },
      ),
    );
  }
}
