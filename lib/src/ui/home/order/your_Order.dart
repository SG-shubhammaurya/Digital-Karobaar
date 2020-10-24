import 'package:digitalkarobaar/src/ui/home/order/All.dart';
import 'package:digitalkarobaar/src/ui/home/order/Delevered.dart';
import 'package:digitalkarobaar/src/ui/home/order/Pending.dart';
import 'package:flutter/material.dart';

import 'place_order.dart';
import 'shipped_order.dart';

class YourOrder extends StatefulWidget {
  @override
  _YourOrderState createState() => _YourOrderState();
}

class _YourOrderState extends State<YourOrder>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            //leading: Icon(Icons.person_outline),
            title: Text(
              'Your Orders',
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
                          text: "All",
                        ),
                        Tab(
                          text: "Pending",
                        ),
                        Tab(
                          text: "Delivered",
                        ),
                        Tab(
                          text: "Shiped",
                        ),
                        Tab(
                          text: "Placed",
                        ),
                        // Tab(
                        //   text: "Processing",
                        // )
                      ]),
                ),
                preferredSize: Size.fromHeight(50.0)),
          ),
          body: TabBarView(
            children: <Widget>[
              All(),
              Pending(),
              Delevered(),
              Shipped(),
              Placed(),
            ],
          )),
    );
  }
}
