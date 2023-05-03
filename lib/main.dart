import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization_example/classes/language_constant.dart';
import 'package:localization_example/pages/bottom_navigation.dart';
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

String stringLocale = 'en';
localeGet() {
  return stringLocale;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  get locale => _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
      stringLocale = locale.toString();
      localeGet();
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
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const BottomNavScreen(),
        onGenerateRoute: CustomRouter.generatedRoute,
        initialRoute: bottomNavRoute,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: _locale,
        supportedLocales: AppLocalizations.supportedLocales);
  }
}
