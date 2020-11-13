

// import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
// import 'package:digitalkarobaar/src/res/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

// class SellerSupport extends StatefulWidget {
//   @override
//   _SellerSupportState createState() => _SellerSupportState();
// }

// class _SellerSupportState extends State<SellerSupport> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(LanguageKeys.support.translate(context)),
//       ),
    
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             SizedBox(height: 50.0),
             
//                Text("Here you will get the Direct Support", style: TextStyle(fontWeight: FontWeight.bold),),
            
//             SizedBox(
//               height: 10.0,
//             ),
        
//             //  SizedBox(height: 50,),
//              Container(
//                 height: 400,
//                 width: 300,
//                 //color: Colors.blue
//                 child: Image.asset("assets/icons/supportIcon.png"),
//               ),
//               SizedBox(
//               height: 20.0,
//             ),
//                             GestureDetector(
//                               onTap: (){
//                                 _chooseOption();
                                
//                               },
//                             child: Container(
//                               //decoration: ,
                
//                               height: 50,
//                               width: 200,
//                               // //width: MediaQuery.of(context).size.width,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50),
//                                 color: AppColors.primaryColor
                                
//                               ),
                              
                              
//                                 child:  Center(
//                                 child: Text(
//                                   LanguageKeys.support.translate(context)
//                                   )
//                                 )
                            

//                             ),
//                             ),
                            
                           
                            
//                           ],
//                         )
//                       ),
                      
//                     );
//                   }
                
//                   _chooseOption() async {
//                     return showDialog(
//                       context: context,
//                       barrierDismissible: true,
//                       builder: (BuildContext context)
//                       {
//                         return AlertDialog(
//                           title: Text("Call for support"),
//                           content: Container(
//                             height: 130,
//                             child: Column(
//                               children: [
                               
//                                 ListTile(
               
//                                   onTap: (){
                  
//                                  String phoneno='tel: 8287007747';
//                                       launch(phoneno);
//                 },
//                 leading: CircleAvatar(
//                   child: Image.asset("assets/icons/call.png"),
//                 ),
//                 title: Text("8287007747",style: TextStyle(fontSize: 14)),

//               ),
//               Divider(),
//               ListTile(
               
//                                   onTap: (){
                  
//                                  String phoneno='tel: 9818246861';
//                                       launch(phoneno);
//                 },
//                 leading: CircleAvatar(
//                   child: Image.asset("assets/icons/call.png"),
//                 ),
//                 title: Text("9818246861",style: TextStyle(fontSize: 14)),

//               ),
              
//                               ],
//                             ),
//                           ),
//                             actions: [
//                               Container(
//                                 child: Center(child: Column(
//                                   children: <Widget> [
//                                     Text(""),
//                                   ]
//                                 ),),
//                               )
//                             ],                          
//                         );
//                       }
//                       );
//                   }





// }


import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

class SellerSupport extends StatefulWidget {
  @override
  _SellerSupportState createState() => _SellerSupportState();
}

class _SellerSupportState extends State<SellerSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageKeys.support.translate(context)),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(
            "Here you will get the Direct Support",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Container(
            height: 300,
            width: 300,
            //color: Colors.blue
            child: Image.asset("assets/icons/supportIcon.png"),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              _chooseOption();
            },
            child: Container(
                //decoration: ,

                height: 50,
                width: 200,
                // //width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.primaryColor),
                child: Center(
                    child: Text(LanguageKeys.support.translate(context),
                        style: TextStyle(color: Colors.white)))),
          ),
        ],
      )),
    );
  }

  _chooseOption() async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Call for support"),
            content: Container(
              height: 130,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      String phoneno = 'tel: 8287007747';
                      launch(phoneno);
                    },
                    leading: CircleAvatar(
                      child: Image.asset("assets/icons/call.png"),
                    ),
                    title: Text("8287007747", style: TextStyle(fontSize: 14)),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      String phoneno = 'tel: 9818246861';
                      launch(phoneno);
                    },
                    leading: CircleAvatar(
                      child: Image.asset("assets/icons/call.png"),
                    ),
                    title: Text("9818246861", style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
            ),
            actions: [
              Container(
                child: Center(
                  child: Column(children: <Widget>[
                    Text(""),
                  ]),
                ),
              )
            ],
          );
        });
  }
}