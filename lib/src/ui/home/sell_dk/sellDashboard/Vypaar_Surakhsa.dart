

// import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
// import 'package:digitalkarobaar/src/models/home_image.dart';
// import 'package:digitalkarobaar/src/repository/home_repository.dart';
// import 'package:digitalkarobaar/src/res/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:digitalkarobaar/src/core/utils/constants/common.dart';


// class VypaarSuraksha extends StatefulWidget {
//   @override
//   _VypaarSurakshaState createState() => _VypaarSurakshaState();
// }

// class _VypaarSurakshaState extends State<VypaarSuraksha> {
//   bool isLoading = true;

//   List<HomeImages> images=[];
//   @override
//   void initState() {
//     _getImages();
//     super.initState();
//   }

//   _getImages() async {
//     var imagesList = await HomeReposiitory.getImages();
//     setState(() {
     

//       if (imagesList != null) {
//          images = imagesList;
//         isLoading = false;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(LanguageKeys.vypaarSuraksha.translate(context)),
//         ),
//         body: isLoading
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : ListView(children: [
//                 Container(
//                   child: Column(children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 500,
                     
                  
//                         child: ListView.builder(
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemCount: images.length,
//                             itemBuilder: (c, index) {
//                               return Image.network(
//                                 images[index].vyaparSurakshaImage,
//                                 fit: BoxFit.cover,
//                               );
//                             }),
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10, right: 10),
//                       child: Center(
//                           child: Text(
//                         "Join us and become a premiun seller and grow your business more faster",
//                         style: TextStyle(fontSize: 15),
//                       )),
//                     ),
//                     SizedBox(height: 40),
//                     InkWell(
//                       onTap: () {
//                         _chooseOption();
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: AppColors.primaryColor),
//                         height: 40,
//                         width: 200,
//                         child: Center(child: Text("Become a premium seller",
//                         style: TextStyle(color: Colors.white),
//                         )),
//                       ),
//                     )
//                   ]),
//                 ),
//                 SizedBox(height: 50),
//               ]));
//   }

//   _chooseOption() async {
//     return showDialog(
//         context: context,
//         barrierDismissible: true,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Call for support"),
//             content: Container(
//               height: 300,
//               child: Column(
//                 children: [
//                   ListTile(
//                     onTap: () {
//                       String phoneno = 'tel: 8287007747';
//                       launch(phoneno);
//                     },
//                     leading: CircleAvatar(
//                       child: Image.asset("assets/icons/call.png"),
//                     ),
//                     title: Text("8287007747", style: TextStyle(fontSize: 14)),
//                   ),
//                   Divider(),
//                   ListTile(
//                     onTap: () {
//                       String phoneno = 'tel: 9818246861';
//                       launch(phoneno);
//                     },
//                     leading: CircleAvatar(
//                       child: Image.asset("assets/icons/call.png"),
//                     ),
//                     title: Text("9818246861", style: TextStyle(fontSize: 14)),
//                   ),
//                   Divider(),
//                   ListTile(
//                     //onLongPress: (){},
//                     onTap: () {
//                       FlutterOpenWhatsapp.sendSingleMessage("+91 9818246861",
//                           "Hello, I want to become a premium seller in Digital Karobaar platform");
//                     },
//                     leading: CircleAvatar(
//                       child: Image.asset("assets/icons/whatsapp.png"),
//                     ),
//                     title: Text("Digital Karobaar WhatsApp",
//                         style: TextStyle(fontSize: 14)),
//                   ),
//                   Divider(),
//                   ListTile(
//                     //onLongPress: (){},
//                     onTap: () {
//                       FlutterOpenWhatsapp.sendSingleMessage("+91 8287007747",
//                           "Hello, I want to become a premium seller in Digital Karobaar platform");
//                     },
//                     leading: CircleAvatar(
//                       child: Image.asset("assets/icons/whatsapp.png"),
//                     ),
//                     title: Text("Digital Karobaar WhatsApp",
//                         style: TextStyle(fontSize: 14)),
//                   ),
//                 ],
//               ),
//             ),
//             actions: [
//               Container(
//                 child: Center(
//                   child: Column(children: <Widget>[
//                     Text(""),
//                   ]),
//                 ),
//               )
//             ],
//           );
//         });
//   }
// }


import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/models/home_image.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';


class VypaarSuraksha extends StatefulWidget {
  @override
  _VypaarSurakshaState createState() => _VypaarSurakshaState();
}

class _VypaarSurakshaState extends State<VypaarSuraksha> {
  bool isLoading = true;

  List<HomeImages> images=[];
  @override
  void initState() {
    _getImages();
    super.initState();
  }

  _getImages() async {
    var imagesList = await HomeReposiitory.getImages();
    setState(() {
     

      if (imagesList != null) {
         images = imagesList;
        isLoading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LanguageKeys.vypaarSuraksha.translate(context)),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(children: [
                Container(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height:300,
                     
                  
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: images.length,
                            itemBuilder: (c, index) {
                              return Image.network(
                                images[index].vyaparSurakshaImage,
                                fit: BoxFit.cover,
                              );
                            }),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Center(
                          child: Text(
                        "Join us and become a premiun seller and grow your business more faster",
                        style: TextStyle(fontSize: 15),
                      )),
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: () {
                        _chooseOption();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primaryColor),
                        height: 40,
                        width: 200,
                        child: Center(child: Text("Become a premium seller",
                        style: TextStyle(color: Colors.white),
                        )),
                      ),
                    )
                  ]),
                ),
                SizedBox(height: 50),
              ]));
  }

  _chooseOption() async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Call for support"),
            content: Container(
              height: 300,
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
                  Divider(),
                  ListTile(
                    //onLongPress: (){},
                    onTap: () {
                      FlutterOpenWhatsapp.sendSingleMessage("+91 9818246861",
                          "Hello, I want to become a premium seller in Digital Karobaar platform");
                    },
                    leading: CircleAvatar(
                      child: Image.asset("assets/icons/whatsapp.png"),
                    ),
                    title: Text("Digital Karobaar WhatsApp",
                        style: TextStyle(fontSize: 14)),
                  ),
                  Divider(),
                  ListTile(
                    //onLongPress: (){},
                    onTap: () {
                      FlutterOpenWhatsapp.sendSingleMessage("+91 8287007747",
                          "Hello, I want to become a premium seller in Digital Karobaar platform");
                    },
                    leading: CircleAvatar(
                      child: Image.asset("assets/icons/whatsapp.png"),
                    ),
                    title: Text("Digital Karobaar WhatsApp",
                        style: TextStyle(fontSize: 14)),
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
