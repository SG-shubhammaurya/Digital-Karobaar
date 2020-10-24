import 'package:digitalkarobaar/src/bloc/localization_cubit/localization_cubit.dart';
import 'package:digitalkarobaar/src/bloc/localization_cubit/localization_state.dart';
import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


class LanguageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LanguageKeys.language.translate(context)),
      content: BlocBuilder<LocaLizationCubit, LocalizationState>(
        builder: (context, localizationState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              
             _languageItem(
                context: context,
                title: LanguageKeys.en,
                locale: localizationState.locale,
              ),
              _languageItem(
                context: context,
                title: LanguageKeys.hi,
                locale: localizationState.locale,
              ),
            ],
          );
        },
      ),
      actions: [
         
        InkWell(
          child: MaterialButton(
            color: Colors.red,
           shape: RoundedRectangleBorder(
             borderRadius:BorderRadius.circular(10)
           ),
           child: Text('Ok'), 
            onPressed: (){
              Navigator.pop(context);
            }),
        )
      ],
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



class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      appBar: AppBar(
         title: Text(LanguageKeys.language.translate(context),style: TextStyle(
          color: Colors.white
        )),
     leading: Builder(
       builder: (BuildContext context) {
         return IconButton(
           icon: const Icon(Icons.arrow_back_ios,color: Colors.white),
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
          ListTile(
            title: Text(
             "Select your preferred language",style: GoogleFonts.openSans(
               fontWeight: FontWeight.w700,
               fontSize: 15
             ),
            ),
            onTap: () => showDialog(
              context: context,
              builder: (context) => LanguageDialog(),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}