import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String LANGUAGE_CODE = 'languageCode';

const String ENGILISH = 'en';
const String MALAYALAM = 'ml';
const String ARABIC = 'ar';
const String HINDI = 'hi';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? ENGILISH;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGILISH:
      return Locale(ENGILISH);
    case MALAYALAM:
      return Locale(MALAYALAM);

    case HINDI:
      return Locale(HINDI);

    case ARABIC:
      return Locale(ARABIC);

    default:
      return Locale(ENGILISH);
  }
}

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}

String localeget = 'en';
