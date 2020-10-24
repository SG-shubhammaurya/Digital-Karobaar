import 'package:digitalkarobaar/src/bloc/theme/theme_state.dart';
import 'package:digitalkarobaar/src/core/utils/preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(ThemeMode defaultThemeMode) : super(ThemeState(defaultThemeMode));

  Future<void> changeTheme(bool value) async {
    final shareprefs = await PreferenceHelper.instance;
    final isDark = shareprefs.isDarkMode;

    if (isDark == value) return;

    await shareprefs.setDarkmode(value);
    emit(ThemeState(value ? ThemeMode.dark : ThemeMode.light));
  }

  Future<ThemeMode> getDefaultTheme() async {
    final shareprefs = await PreferenceHelper.instance;
    final isDark = shareprefs.isDarkMode;

    if (isDark == null) {
      await shareprefs.setDarkmode(false);
      return ThemeMode.light;
    } else {
      ThemeMode defaultMode = isDark ? ThemeMode.dark : ThemeMode.light;
      return defaultMode;
    }
  }
}
