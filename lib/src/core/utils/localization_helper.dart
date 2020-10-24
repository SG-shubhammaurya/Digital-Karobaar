
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class AppLocalizations{
  final Locale locale;

  AppLocalizations(this.locale);

   static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }
  static const LocalizationsDelegate<AppLocalizations> delegate =_AppLocalizationsDelegate();

Map<String, String> _localizedStrings;

  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('assets/langs/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }
   String translate(String key) {
    return _localizedStrings[key];
  }

}
class _AppLocalizationsDelegate  extends LocalizationsDelegate<AppLocalizations>{

  const _AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
     return ["en","hi"].contains(locale.languageCode);
    }
  
    @override
    Future<AppLocalizations> load(Locale locale) async{
       AppLocalizations appLocalizations = AppLocalizations(locale);
      await appLocalizations.load();
      return appLocalizations;
    }
     @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
  

}