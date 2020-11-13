// import 'package:digitalkarobaar/src/core/widget/common_button.dart';
// import 'package:digitalkarobaar/src/res/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:share/share.dart';
// class Admin extends StatefulWidget {
//   @override
//   _AdminState createState() => _AdminState();
// }

// class _AdminState extends State<Admin> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       body: ListView(
//         children: [
//          Padding(
//            padding: const EdgeInsets.only(left:10.0,top: 20.0),
//            child: Column(children: [
//              Row(
//                children: [
//                  Text(
//                    //"Add Member to make a team and ",
//                    "Add your business assiciates as",
//                    style: TextStyle(fontSize: 20),),
//                ],
//              ),
//             SizedBox(height: 10.0),
//              Row(
//                children: [
//                  Text(
//                    //"and boost.Your business growth ",
//                    "member of your online business ",
//                    style: TextStyle(fontSize: 20),),
//                  SizedBox(height: 10.0),
                 
//                ],
//              ),
//              SizedBox(height: 10.0),
//              Row(
//                children: [
//                  Text("on. Digital Karobaar",style: TextStyle(fontSize: 20),),
//                  SizedBox(height: 10.0),
                 
//                ],
//              ),
//              SizedBox(height: 30.0),
             
//            ],
//             ),
//          ),
//          Padding(
//            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//            child: Center(
//              child: Text("Make a team and handle all the orders samelessly on the app!")
             
//            ),
//          ),
//          //SizedBox(height: 15.0),

//          Container(
//                 height: 400,
//                 width: 400,
//                 //color: Colors.blue
//                 child: Image.asset("assets/icons/invite.png",fit: BoxFit.fill,),
//               ),




//          SizedBox(height: 15.0),


//          GestureDetector(
//            onTap: ()async {
//              String p = await shareNumber();
//                               share(context, p);
                                 
//                             },
          
           
//            child: Padding(
//              padding: const EdgeInsets.only(left: 20.0,right: 20.0),
//              child: Container(
//                decoration: BoxDecoration(
//                  color: AppColors.primaryColor,
//                  borderRadius: BorderRadius.circular(30)
//                ),
//                height: 50,
//                width: 10.0,
//                child: Center(child: Text("Add Members",style: TextStyle(fontSize: 20),)),
               
//              ),
//            ),
//          ),
//         SizedBox(height: 50),

         

//         ],
//       )
      
//     );
//   }

//   void share(BuildContext context, String t) {
//     Share.share(t);
//   }

//   shareNumber() async {
//     return "join my tean in Digital Karobaar to speed up your Business..Null".toString();
//     //Text('9935020063').toString();
//     // Container(
//     //   child: Text("9935020063".toString())
//     // );
//   }
  
// }


import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15.0),
            Row(
              children: [
                Text("Add your business assiciates as",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              children: [
                Text(
                    //"and boost.Your business growth ",
                    "member of your online business ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                SizedBox(height: 5.0),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              children: [
                Text("on. Digital Karobaar",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                SizedBox(height: 10.0),
              ],
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Center(
                  child: Text(
                      "Make a team and handle all the orders samelessly on the app!",
                      style: TextStyle(fontSize: 15))),
            ),
            //SizedBox(height: 15.0),

            Container(
              height: 200,
              width: 200,
              //color: Colors.blue
              child: Image.asset(
                "assets/icons/invite.png",
                fit: BoxFit.fill,
              ),
            ),

            SizedBox(height: 15.0),

            CommonButton(
              buttonColor: AppColors.primaryColor,
              title: 'Add Members',
              onTap: () async {
                String p = await shareNumber();
                share(context, p);
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void share(BuildContext context, String t) {
    Share.share(t);
  }

  shareNumber() async {
    return "join my tean in Digital Karobaar to speed up your Business..Null"
        .toString();
    //Text('9935020063').toString();
    // Container(
    //   child: Text("9935020063".toString())
    // );
  }
}