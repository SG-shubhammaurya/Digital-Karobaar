import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/ui/feeds/feeds.dart';
import 'package:digitalkarobaar/src/ui/home/allproducts/kyc_home.dart';
import 'package:digitalkarobaar/src/ui/messenger/messenger.dart';
import 'package:digitalkarobaar/src/ui/profile/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

class SubCategoriesDetails extends StatefulWidget {
  final topBrandId;
 const SubCategoriesDetails(this.topBrandId);
  @override
  _SubCategoriesDetailsState createState() => _SubCategoriesDetailsState();
}

class _SubCategoriesDetailsState extends State<SubCategoriesDetails> {
  int currentIndex = 0;
var id;
  List<Widget> navItems;
 
  @override
  void initState() {
    id = widget.topBrandId;
    navItems= [KycHome(id), Feeds(), Messenger(), UpdateProfile()];
    super.initState();
  }
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
        icon: Icon(Icons.cloud_upload),
       
       activeColor: AppColors.primaryColor,
       inactiveColor:Colors.grey,
        title: Text("kyc",
          //LanguageKeys.kyc.translate(context),
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
