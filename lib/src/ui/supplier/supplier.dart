import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:flutter/material.dart';

class SupplierPage extends StatefulWidget {
  @override
  _SupplierPageState createState() => _SupplierPageState();
}

class _SupplierPageState extends State<SupplierPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      //   centerTitle: true,
      //   title: Text(
      //     'Supplier',
      //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //   ),
      //   actions: [
      //      Padding(
      //        padding: const EdgeInsets.all(8.0),
      //        child: Container(
      //               height: 20,
      //               width: 100,
      //               child: TextField(
      //                 decoration: InputDecoration(
                        
      //                     prefixIcon: Icon(Icons.search),
      //                     fillColor: Colors.black12,
      //                     filled: true,
      //                     enabledBorder: OutlineInputBorder(
      //                         borderSide: BorderSide(color: Colors.white)),
      //                     border: OutlineInputBorder(
      //                         borderRadius:
      //                             BorderRadius.all(Radius.circular(50)))),
      //               )),
      //      )
      //   ],
      // ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 10),
         Card(
           child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.keyboard_arrow_left),
              Text(
                'Supplier',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                  height: 30,
                  width: 100,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        fillColor: Colors.black12,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50)))),
                  ))
            ],
          ),

         ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 80,
                  width: 80,
                  color: Colors.red[100],
                ),
              ),
              Text("Somthing..here.."),
              Container(
                height: 30,
                width: 100,
                child: Center(
                    child: Text('follow',
                        style: TextStyle(color: AppColors.primaryColor))),
                decoration: BoxDecoration(
                    color: Colors.red[100],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              )
            ],
          ),
          SizedBox(height: 10),
          Divider(),
          _getBodyTab
        ],
      )),
    );
  }

  get _getBodyTab {
    return TabBar(
        unselectedLabelColor: Colors.black54,
        //  labelColor: Colors.black,
        indicatorColor: AppColors.primaryColor,
        controller: tabController,
        tabs: [
          Tab(child: Text('Home')),
          Tab(child: Text('Product')),
          Tab(child: Text('Profile')),
          Tab(child: Text('Feeds')),
        ]);
  }
}
