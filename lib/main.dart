import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization_example/classes/language_constant.dart';
import 'package:localization_example/pages/home_page.dart';
import 'package:localization_example/router/custom_router.dart';
import 'package:localization_example/router/route_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => setLocale(locale));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        onGenerateRoute: CustomRouter.generatedRoute,
        initialRoute: homeRoute,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: _locale,
        supportedLocales: AppLocalizations.supportedLocales);
  }
}
