// import 'package:digitalkarobaar/src/bloc/cart/cart_cubit.dart';
// import 'package:digitalkarobaar/src/bloc/chat_cubit/chat.cubit.dart';
// import 'package:digitalkarobaar/src/bloc/localization_cubit/localization_cubit.dart';
// import 'package:digitalkarobaar/src/bloc/otp/otp_cubit.dart';
// import 'package:digitalkarobaar/src/bloc/registration/registration_cubit.dart';
// import 'package:digitalkarobaar/src/bloc/theme/theme_cubit.dart';
// import 'package:digitalkarobaar/src/core/provider/cart_provider.dart';
// import 'package:digitalkarobaar/src/repository/auth_repository.dart';
// import 'package:digitalkarobaar/src/repository/home_repository.dart';
// import 'package:digitalkarobaar/src/res/supported_locales.dart';
// import 'package:digitalkarobaar/src/splace_Screen.dart';
// import 'package:digitalkarobaar/src/ui/auth/main_screen.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/myAccount/brand_mov.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'src/bloc/localization_cubit/localization_state.dart';
// import 'src/bloc/orderplace/order_place_cubit.dart';
// import 'src/bloc/productUpload/product_upload_bloc.dart';
// import 'src/bloc/search/search_cubit.dart';
// import 'src/bloc/seller/seller_details_cubit.dart';
// import 'src/bloc/theme/theme_state.dart';
// import 'src/core/utils/constants/app_theme.dart';
// import 'src/core/utils/localization_helper.dart';
// import 'src/core/widget/bottom_nav.dart';
// import 'src/repository/chat_repository.dart';
// import 'src/repository/order_repository.dart';
// import 'src/repository/product_upload_repo.dart';
// import 'src/repository/sell_respository.dart';
// import 'src/route/app_router.dart';
// import 'src/route/router_name.dart';
// import 'src/ui/home/cart/Check_out.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Color(0xFFbb4d00),
//       statusBarIconBrightness: Brightness.light,
//       statusBarBrightness: Brightness.light,
//       systemNavigationBarIconBrightness: Brightness.light));

//   final defaultLocale = await _getLocalizationLogic();
//   final defaultTheme = await _getAppTheme();
//   runApp(MyApp(defaultLocale, defaultTheme));
// }

// class MyApp extends StatelessWidget {
//   final Locale defaultLocale;
//   final ThemeMode defaultTheme;
//   const MyApp([this.defaultLocale, this.defaultTheme]);
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//         providers: [
//           BlocProvider<RegistrationCubit>(
//             create: (context) => RegistrationCubit(AuthRepository()),
//           ),
//           BlocProvider<OtpCubit>(
//             create: (context) => OtpCubit(AuthRepository()),
//           ),
//           BlocProvider<SearchCubit>(
//             create: (context) => SearchCubit(HomeReposiitory()),
//           ),
//           BlocProvider<LocaLizationCubit>(
//             create: (context) => LocaLizationCubit(defaultLocale),
//           ),
//           BlocProvider<ThemeCubit>(
//             create: (context) => ThemeCubit(defaultTheme),
//           ),
//           BlocProvider(create: (contexts) => ChatCubit(ChatRepository())),
//           ChangeNotifierProvider<CartDetailProvider>(
//             create: (_) => CartDetailProvider(),
//           ),
//           ChangeNotifierProvider<RegisteredType>(
//             create: (_) => RegisteredType(),
//           ),
//           // ChangeNotifierProvider<PaymetOptionType>(
//           //   create: (_) => PaymetOptionType(),
//           // ),
//           BlocProvider(create: (contexts) => SellerCubit(SellRepository())),
//           BlocProvider(
//               create: (contexts) => CartCubit(ProductOrderRepository())),
//           BlocProvider(
//               create: (contexts) => OrderPlaceCubit(ProductOrderRepository())),
//           BlocProvider(
//               create: (contexts) => ProductUploadCubit(ProductUploadRepo())),
//         ],
//         child: BlocBuilder<LocaLizationCubit, LocalizationState>(
//             builder: (context, localizationCubit) {
//           return BlocBuilder<ThemeCubit, ThemeState>(
//             builder: (context, themecubit) {
//               return MaterialApp(
//                 themeMode: themecubit.themeMode,
//                 darkTheme: darkTheme,
//                 theme: lightTheme,
//                 locale: localizationCubit.locale,
//                 supportedLocales: supportedLocales,
//                 localizationsDelegates: [
//                   GlobalMaterialLocalizations.delegate,
//                   GlobalWidgetsLocalizations.delegate,
//                   AppLocalizations.delegate,
//                 ],
//                 debugShowCheckedModeBanner: false,
//                 title: 'DigitalKarobaar',
//                 home: RedirectWidget(),
//                 initialRoute: RouterName.initialRoute,
//                 onGenerateRoute: AppRouter.getGeneratedRouute,
//               );
//             },
//           );
//         }));
//   }
// }

// class RedirectWidget extends StatefulWidget {
//   @override
//   _RedirectWidgetState createState() => _RedirectWidgetState();
// }

// class _RedirectWidgetState extends State<RedirectWidget> {
//   @override
//   void initState() {
//     _getToken();
//     super.initState();
//   }

//   SharedPreferences prefs;
//   _getToken() async {
//     prefs = await SharedPreferences.getInstance();

//     //this is temporary soln
//     if (prefs.getString('accessToken') != null) {
//       print(prefs.getString('accessToken'));

//       mainPage = AppSplaceScreen();
//     } else {
//       mainPage = MainScreen();
//     }

//     setState(() {});
//   }

//   Widget mainPage = Container(
//     color: Colors.white,
//     child: Center(
//       child: CircularProgressIndicator(),
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return mainPage;
//   }
// }

// Future<Locale> _getLocalizationLogic() async {
//   final LocaLizationCubit localizationCubit = LocaLizationCubit(null);
//   final defaultLocale = await localizationCubit.loadDefaultLocale();
//   await localizationCubit?.close();

//   return defaultLocale;
// }

// Future<ThemeMode> _getAppTheme() async {
//   final ThemeCubit themeCubit = ThemeCubit(null);
//   final defaultThemeMode = await themeCubit.getDefaultTheme();
//   await themeCubit?.close();

//   return defaultThemeMode;
// }


import 'package:digitalkarobaar/src/bloc/cart/cart_cubit.dart';
import 'package:digitalkarobaar/src/bloc/chat_cubit/chat.cubit.dart';
import 'package:digitalkarobaar/src/bloc/localization_cubit/localization_cubit.dart';
import 'package:digitalkarobaar/src/bloc/otp/otp_cubit.dart';
import 'package:digitalkarobaar/src/bloc/registration/registration_cubit.dart';
import 'package:digitalkarobaar/src/bloc/theme/theme_cubit.dart';
import 'package:digitalkarobaar/src/core/provider/cart_provider.dart';
import 'package:digitalkarobaar/src/repository/auth_repository.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/res/supported_locales.dart';
import 'package:digitalkarobaar/src/splace_Screen.dart';
import 'package:digitalkarobaar/src/ui/auth/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/bloc/localization_cubit/localization_state.dart';
import 'src/bloc/orderplace/order_place_cubit.dart';
import 'src/bloc/productUpload/product_upload_bloc.dart';
import 'src/bloc/search/search_cubit.dart';
import 'src/bloc/seller/seller_details_cubit.dart';
import 'src/bloc/theme/theme_state.dart';
import 'src/core/utils/constants/app_theme.dart';
import 'src/core/utils/localization_helper.dart';
import 'src/repository/chat_repository.dart';
import 'src/repository/order_repository.dart';
import 'src/repository/product_upload_repo.dart';
import 'src/repository/sell_respository.dart';
import 'src/route/app_router.dart';
import 'src/route/router_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFbb4d00),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light));

  final defaultLocale = await _getLocalizationLogic();
  final defaultTheme = await _getAppTheme();
  runApp(MyApp(defaultLocale, defaultTheme));
}

class MyApp extends StatelessWidget {
  final Locale defaultLocale;
  final ThemeMode defaultTheme;
  const MyApp([this.defaultLocale, this.defaultTheme]);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          BlocProvider<RegistrationCubit>(
            create: (context) => RegistrationCubit(AuthRepository()),
          ),
          BlocProvider<OtpCubit>(
            create: (context) => OtpCubit(AuthRepository()),
          ),
          BlocProvider<SearchCubit>(
            create: (context) => SearchCubit(HomeReposiitory()),
          ),
          BlocProvider<LocaLizationCubit>(
            create: (context) => LocaLizationCubit(defaultLocale),
          ),
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(defaultTheme),
          ),
          BlocProvider(create: (contexts) => ChatCubit(ChatRepository())),
          ChangeNotifierProvider<CartDetailProvider>(
            create: (_) => CartDetailProvider(),
          ),
          BlocProvider(create: (contexts) => SellerCubit(SellRepository())),
          BlocProvider(
              create: (contexts) => CartCubit(ProductOrderRepository())),
          BlocProvider(
              create: (contexts) => OrderPlaceCubit(ProductOrderRepository())),
          BlocProvider(
              create: (contexts) => ProductUploadCubit(ProductUploadRepo())),
        ],
        child: BlocBuilder<LocaLizationCubit, LocalizationState>(
            builder: (context, localizationCubit) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themecubit) {
              return MaterialApp(
                themeMode: themecubit.themeMode,
                darkTheme: darkTheme,
                theme: lightTheme,
                locale: localizationCubit.locale,
                supportedLocales: supportedLocales,
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  AppLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                title: 'DigitalKarobaar',
                home: RedirectWidget(),
                initialRoute: RouterName.initialRoute,
                onGenerateRoute: AppRouter.getGeneratedRouute,
              );
            },
          );
        }));
  }
}

class RedirectWidget extends StatefulWidget {
  @override
  _RedirectWidgetState createState() => _RedirectWidgetState();
}

class _RedirectWidgetState extends State<RedirectWidget> {
  @override
  void initState() {
    _getToken();
    super.initState();
  }

  SharedPreferences prefs;
  _getToken() async {
    prefs = await SharedPreferences.getInstance();

    //this is temporary soln
    if (prefs.getString('accessToken') != null) {
      print(prefs.getString('accessToken'));

      mainPage = AppSplaceScreen();
    } else {
      mainPage = MainScreen();
    }

    setState(() {});
  }

  Widget mainPage = Container(
    color: Colors.white,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return mainPage;
  }
}

Future<Locale> _getLocalizationLogic() async {
  final LocaLizationCubit localizationCubit = LocaLizationCubit(null);
  final defaultLocale = await localizationCubit.loadDefaultLocale();
  await localizationCubit?.close();

  return defaultLocale;
}

Future<ThemeMode> _getAppTheme() async {
  final ThemeCubit themeCubit = ThemeCubit(null);
  final defaultThemeMode = await themeCubit.getDefaultTheme();
  await themeCubit?.close();

  return defaultThemeMode;
}
