import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/res/app_text_style.dart';
import 'package:digitalkarobaar/src/ui/feeds/feeds.dart';
import 'package:digitalkarobaar/src/ui/home/home_page.dart';
import 'package:digitalkarobaar/src/ui/messenger/messenger.dart';
import 'package:digitalkarobaar/src/ui/profile/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List<Widget> navItems = [HomePage(), Feeds(), Messenger(), UpdateProfile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navItems[currentIndex],
      bottomNavigationBar: BottomNavyBar(
            

            // unselectedItemColor: Colors.white,
            // selectedItemColor: Colors.orange[900],
            //  selectedLabelStyle: TextStyle(color:Colors.red),
            // type: BottomNavigationBarType.fixed,
            // onTap: (int i) {
            //   setState(() {
            //     currentIndex = i;
            //   });
            // },
            // currentIndex: currentIndex,
            selectedIndex: currentIndex,
        //  backgroundColor: AppColors.primaryColor,
          showElevation: false,
           iconSize: 18,

          //  showElevation: true, // use this to remove appBar's elevation
            onItemSelected: (index) => setState(() {
      currentIndex = index;

            }),
            items: [
      BottomNavyBarItem(
        icon: Icon(Icons.home),
       
       activeColor: AppColors.primaryColor,
       inactiveColor:Colors.blue,
        title: Text(LanguageKeys.home.translate(context),
         style: TextStyle(color:Colors.grey),
        ),
      ),
      BottomNavyBarItem(
           inactiveColor: Colors.grey,
            activeColor: AppColors.primaryColor,
          icon: Icon(Icons.add_alarm),
          title: Text(LanguageKeys.feeds.translate(context))),
      BottomNavyBarItem(
          inactiveColor: Colors.grey,
           activeColor: AppColors.primaryColor,
          icon: Icon(Icons.message),
          title: Text(LanguageKeys.messanger.translate(context))),
      BottomNavyBarItem(
          inactiveColor: Colors.grey,
           activeColor: AppColors.primaryColor,
          icon: Icon(Icons.person_pin),
          title: Text(LanguageKeys.profile.translate(context))),
            ],
          ),
    );
  }
}
