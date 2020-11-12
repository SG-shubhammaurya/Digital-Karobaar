import 'package:digitalkarobaar/src/bloc/localization_cubit/localization_cubit.dart';
import 'package:digitalkarobaar/src/bloc/localization_cubit/localization_state.dart';
import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageKeys.language.translate(context),
            style: TextStyle(color: Colors.white)),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
              tooltip: "Back",
            );
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          BlocBuilder<LocaLizationCubit, LocalizationState>(
            builder: (context, localizationState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _languageItem(
                    context: context,
                    title: LanguageKeys.en,
                    locale: localizationState.locale,
                  ),
                      Divider(),
                  _languageItem(
                    context: context,
                    title: LanguageKeys.hi,
                    locale: localizationState.locale,
                  ),
                ],
              );
            },
          ),
         
          Divider(),
        ],
      ),
    );
  }

  Widget _languageItem({
    BuildContext context,
    String title,
    Locale locale,
  }) {
    final isSelected = locale.languageCode == title.toLowerCase();
    print(title);
    return RadioListTile(
      groupValue: 0,
      selected: isSelected,
      title: Text(title.translate(context)),
      onChanged: (_) =>
          context.bloc<LocaLizationCubit>().changeLocale(title.toLowerCase()),
      value: isSelected ? 0 : 1,
    );
  }
}
