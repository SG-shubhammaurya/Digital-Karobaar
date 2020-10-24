import 'package:flutter/material.dart';

class DisputesPage extends StatefulWidget {
  @override
  _DisputesPageState createState() => _DisputesPageState();
}

class _DisputesPageState extends State<DisputesPage>  with SingleTickerProviderStateMixin{

   TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length:4,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
          
            title: Text(
              'Disputes',
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
   bottom: PreferredSize(child:          Container(
                      color: Colors.white,
                      child: TabBar(
                          isScrollable: true,
                          unselectedLabelColor: Colors.black.withOpacity(0.3),
                          indicatorColor: Colors.white,
                          tabs: [
                            Tab(
                              text: "Active",
                            ),
                            Tab(
                              text: "Rejected",
                            ),
                            Tab(
                              text: "Approved",
                            ),
                            Tab(
                              text: "",
                            ),
                           
                            
                          ]),
                    ),
                  
                 
    preferredSize: Size.fromHeight(50.0)),
           
          ),
          body: TabBarView(
            children: <Widget>[
             Text('Coming soon'),
              Text('data'),
           Text('data'),
           Text(''),
      
          
            ],
          )),
    );
  }
}