import 'package:digitalkarobaar/src/ui/home/yourOrder/Seller_all.dart';
import 'package:digitalkarobaar/src/ui/home/yourOrder/Seller_pending.dart';
import 'package:flutter/material.dart';

import 'Seller_Shipped.dart';
import 'Seller_delivered.dart';
import 'Seller_placed.dart';
class SellerOrder extends StatefulWidget {
  @override
  _SellerOrderState createState() => _SellerOrderState();
}
class _SellerOrderState extends State<SellerOrder> {
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
                              text: "    All    ",
                            ),
                            Tab(
                              text: "    Pending    ",
                            ),
                            Tab(
                              text: "     Placed    ",
                            ),
                            Tab(
                              text: "    Delivered    ",
                            ),
                            Tab(
                              text: "    Shiped    ",
                            ),
                          ]),
                    ),
          preferredSize: Size.fromHeight(50.0)),
          ),
          body: TabBarView(
            children: <Widget>[
              OrderAll(),
              OrderPending(),
              OrderPlaced(),
              OrderDelivered(),
              OrderShiped()
            ],
          )),
    );
  }
}