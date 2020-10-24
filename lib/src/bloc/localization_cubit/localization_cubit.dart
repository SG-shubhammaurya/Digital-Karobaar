import 'package:digitalkarobaar/src/bloc/localization_cubit/localization_state.dart';
import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/core/utils/preference_helper.dart';
import 'package:digitalkarobaar/src/res/supported_locales.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class LocaLizationCubit extends Cubit<LocalizationState> {
  LocaLizationCubit(Locale locale)
      : super(LocalizationState(locale ?? supportedLocales[0]));

  Future<void> changeLocale(String selectedLanguageCode) async {

    final sharedPrefesHelper = await PreferenceHelper.instance;
    final getDefaultLanguageCode = sharedPrefesHelper.languageCode;

    if (getDefaultLanguageCode == selectedLanguageCode) return;

    if (selectedLanguageCode == LanguageKeys.en) {
      _loadLanguage(sharedPrefesHelper, Locale('en', 'US'));
    } else if(selectedLanguageCode == LanguageKeys.hi){
        _loadLanguage(sharedPrefesHelper,  Locale('hi', 'IN'),);
    }
  }

  Future<Locale> loadDefaultLocale() async {
    final prefersHelper = await PreferenceHelper.instance;

    final defaultLanguageCode = prefersHelper.languageCode;

    if (defaultLanguageCode == null) {
      _loadLanguage(prefersHelper, supportedLocales[0], false);
      return supportedLocales[0];
    } else {
      final defaultCountryCode = prefersHelper.countryCode;

      final defaultLocale = Locale(defaultLanguageCode, defaultCountryCode);

      _loadLanguage(prefersHelper, defaultLocale, false);
      return defaultLocale;
    }
  }

  _loadLanguage(PreferenceHelper sharedPrefesHelper, Locale locale,
      [bool notifyState=true]) async {
    await sharedPrefesHelper.setLanguageCode(locale.languageCode);
    await sharedPrefesHelper.setCountryCode(locale.countryCode);

    if (notifyState) emit(LocalizationState(locale));
  }
}
