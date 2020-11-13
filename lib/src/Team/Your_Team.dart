// import 'package:digitalkarobaar/src/Team/Admin/admin.dart';
// import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
// import 'package:flutter/material.dart';
// import 'Manage/Manage.dart';
// import 'Member/TeamMember.dart';
// import 'package:digitalkarobaar/src/core/utils/constants/common.dart';


// class YourTeam extends StatefulWidget {
//   @override
//   _YourTeamState createState() => _YourTeamState();
// }


// class _YourTeamState extends State<YourTeam>
//     with SingleTickerProviderStateMixin {
      
// TabController _tabController;
//   @override
//   void initState() {
//     _tabController = TabController(length: 3, vsync: this);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             title: Text(LanguageKeys.manageYourTeam.translate(context)),
//    bottom: PreferredSize(
//                     child: Container(
//                       color: Colors.black12,
//                       width: MediaQuery.of(context).size.width,
                      
//                       child: TabBar(
                        
                      
//                         //controller: Colors.blue,
//                           isScrollable: true,
//                           unselectedLabelColor: Colors.black.withOpacity(0.3),
//                           indicatorColor: Colors.black,
//                           tabs: [
//                             Tab(
//                               text: "     Admin     ",
//                             ),
//                             Tab(
//                               text: "    Manage     ",
//                             ),
//                             Tab(
//                               text: "    Member     ",
//                             ), 
//                           ]
//                         ),
//                     ),
                  
                 
//     preferredSize: Size.fromHeight(50.0)),
            
//           ),
//           body: TabBarView(
//             children: <Widget>[
//               Admin(),
//               Manage(),
//               TeamMember(),
//             ],
//           )),
//     );
//   }
// }



import 'package:digitalkarobaar/src/Team/Admin/admin.dart';
import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:flutter/material.dart';
import 'Manage/Manage.dart';
import 'Member/TeamMember.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

class YourTeam extends StatefulWidget {
  @override
  _YourTeamState createState() => _YourTeamState();
}

class _YourTeamState extends State<YourTeam>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(LanguageKeys.manageYourTeam.translate(context)),
            bottom: PreferredSize(
                child: Container(
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                  child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Colors.white,
                      labelColor: Colors.white,
                      tabs: [
                        Tab(
                          text: "     Admin     ",
                        ),
                        Tab(
                          text: "    Manage     ",
                        ),
                        Tab(
                          text: "    Member     ",
                        ),
                      ]),
                ),
                preferredSize: Size.fromHeight(50.0)),
          ),
          body: TabBarView(
            children: <Widget>[
              Admin(),
              Manage(),
              TeamMember(),
            ],
          )),
    );
  }
}
