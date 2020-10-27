import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/ui/home/InAppNotification/Product_notification.dart';
import 'package:digitalkarobaar/src/ui/home/InAppNotification/Seller_Notification.dart';
import 'package:flutter/material.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

class AppNotification extends StatefulWidget {
  @override
  _AppNotificationState createState() => _AppNotificationState();
}

class _AppNotificationState extends State<AppNotification>
 with SingleTickerProviderStateMixin {
   TabController _tabController;

    @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            //leading: Icon(Icons.person_outline),
            title: Text(
              LanguageKeys.notification.translate(context),
              style: TextStyle(color: Colors.white),
            ),
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
            bottom: PreferredSize(
                child: Container(
                  color: Colors.black12,
                  child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.black.withOpacity(0.3),
                      indicatorColor: Colors.black,
                      tabs: [
                        Tab(
                          text: "   Product Notification   ",
                        ),
                        Tab(
                          text: "   Seller Notification   ",
                        ),
                        // Tab(
                        //   text: "Delivered",
                        // ),
                        // Tab(
                        //   text: "Shiped",
                        // ),
                        // Tab(
                        //   text: "Placed",
                        // ),
                        // Tab(
                        //   text: "Processing",
                        // )
                      ]),
                ),
                preferredSize: Size.fromHeight(50.0)),
          ),
          body: TabBarView(
            children: <Widget>[
              InApplicationNotification(),
              SellerNotification(),
              //All(),
              //Pending(),
             // Delevered(),
              //Shipped(),
             // Placed(),
            ],
          )),
    );
  }
}