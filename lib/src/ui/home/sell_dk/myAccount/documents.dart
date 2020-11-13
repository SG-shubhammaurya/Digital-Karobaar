// import 'dart:io';

// import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
// import 'package:digitalkarobaar/src/core/widget/common_button.dart';
// import 'package:digitalkarobaar/src/core/widget/common_upload_file_alert.dart';
// import 'package:digitalkarobaar/src/repository/sell_respository.dart';
// import 'package:digitalkarobaar/src/res/app_colors.dart';
// import 'package:digitalkarobaar/src/res/app_text_style.dart';
// import 'package:digitalkarobaar/src/route/router_name.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class Documents extends StatelessWidget {
//   final id;
//   Documents(this.id);
//   var gstNumber;
//   File docFile;
//   File signFile;
//      final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//   print(id);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Documents'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(
//           children: [
//             const SizedBox(height: 10),
//             Text('GST Number'),
//             const SizedBox(height: 10),
//             Form(
//               key: _formKey,
//               child: TextFormField(
//                   keyboardType: TextInputType.number,
//                   autofocus: true,
//                   onSaved: (gstNo) {
//                     gstNumber = gstNo;
//                   },
//                   onChanged: (val) {},
//                   decoration: inputDecoration(hint: "Enter GST Number")),
//             ),
//             SizedBox(height: 20),
//             const Text('GST DOCUMENTS'),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     CommonAlertBox.takeImageFromCamera(context,
//                         onUploadCallback: (file) {
//                       print(file.path.toString());
//                       docFile = file;
//                     });
//                   },
//                   child: Container(
//                     width: 100,
//                     padding: const EdgeInsets.all(8),
//                     child: Center(
//                         child: Text(
//                       'Upload Cancelled Cheque',
//                       maxLines: 1,
//                       style: TextStyle(fontSize: 10),
//                     )),
//                     decoration: BoxDecoration(
//                         border: Border.all(color: AppColors.primaryColor)),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () async{
//                     try{
//                        await CommonAlertBox.takeImageFromCamera(context,
//                         onUploadCallback: (file) {
//                       print(file.path.toString());
//                       docFile = file;
//                     });

//                     }catch(e){}
//                   },
//                   child: Container(
//                     width: 100,
//                     padding: const EdgeInsets.all(8),
//                     child: Center(
//                         child: Text('Upload File',
//                             style: TextStyle(fontSize: 10))),
//                     decoration: BoxDecoration(
//                         border: Border.all(color: AppColors.primaryColor)),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(height: 20),
//             const Text('Signature*'),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     CommonAlertBox.takeImageFromCamera(context,
//                         onUploadCallback: (file) {
//                       print(file.path.toString());
//                       signFile = file;
//                     });
//                   },
//                   child: Container(
//                     width: 100,
//                     padding: const EdgeInsets.all(8),
//                     child: Center(
//                         child: Text(
//                       'Upload Cancelled Cheque',
//                       maxLines: 1,
//                       style: TextStyle(fontSize: 10),
//                     )),
//                     decoration: BoxDecoration(
//                         border: Border.all(color: AppColors.primaryColor)),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () async {
//                     await CommonAlertBox.takeImageFromCamera(context,
//                         onUploadCallback: (file) {
//                       print(file.path.toString());
//                       signFile = file;
//                     });
//                   },
//                   child: Container(
//                     width: 100,
//                     padding: const EdgeInsets.all(8),
//                     child: Center(
//                         child: Text('Upload File',
//                             style: TextStyle(fontSize: 10))),
//                     decoration: BoxDecoration(
//                         border: Border.all(color: AppColors.primaryColor)),
//                   ),
//                 )
//               ],
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CommonButton(
//                     buttonColor: AppColors.primaryColor,
//                     titleColor: Colors.white,
//                     title: "Save next",
//                     onTap: () {
                     
//                     // Navigator.pushNamed(context, RouterName.pickupAddress);
//                       if (_formKey.currentState.validate()) {
//                         _formKey.currentState.save();
//                         if (docFile != null && signFile != null) {
//                           _uploadDocument(context);
//                         } else {
//                           Fluttertoast.showToast(
//                               backgroundColor: AppColors.primaryColor,
//                               msg: "Please Upload File");
//                         }
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _uploadDocument(BuildContext context) async {
//     SellRepository.uploadDocuments(docFile, signFile, id.toString(), gstNumber).then((id){
//      if(id !=null){
//      Navigator.pushReplacementNamed(context, RouterName.pickupAddress,arguments: id.toString());
//      }
//     }).catchError((e){
//          showMessagess('Error');

//     });
//   }
// }


import 'dart:io';

import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/core/widget/common_upload_file_alert.dart';
import 'package:digitalkarobaar/src/repository/sell_respository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/res/app_text_style.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Documents extends StatelessWidget {
  final id;
  Documents(this.id);
  var gstNumber;
  File docFile;
  File signFile;
     final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
  print(id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Documents'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Text('GST Number'),
            const SizedBox(height: 10),
            Form(
              key: _formKey,
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  onSaved: (gstNo) {
                    gstNumber = gstNo;
                  },
                  onChanged: (val) {},
                  decoration: inputDecoration(hint: "Enter GST Number")),
            ),
            SizedBox(height: 20),
            const Text('GST DOCUMENTS'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    CommonAlertBox.takeImageFromCamera(context,
                        onUploadCallback: (file) {
                      print(file.path.toString());
                      docFile = file;
                    });
                  },
                  child: Container(
                    width: 100,
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Text(
                      'Upload Cancelled Cheque',
                      maxLines: 1,
                      style: TextStyle(fontSize: 10),
                    )),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor)),
                  ),
                ),
                InkWell(
                  onTap: () async{
                    try{
                       await CommonAlertBox.takeImageFromCamera(context,
                        onUploadCallback: (file) {
                   //   print(file.path.toString());
                      docFile = file;
                    });

                    }catch(e){}
                  },
                  child: Container(
                    width: 100,
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Text('Upload File',
                            style: TextStyle(fontSize: 10))),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor)),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            const Text('Signature*'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    CommonAlertBox.takeImageFromCamera(context,
                        onUploadCallback: (file) {
                  //    print(file.path.toString());
                      signFile = file;
                    });
                  },
                  child: Container(
                    width: 100,
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Text(
                      'Upload Cancelled Cheque',
                      maxLines: 1,
                      style: TextStyle(fontSize: 10),
                    )),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor)),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await CommonAlertBox.takeImageFromCamera(context,
                        onUploadCallback: (file) {
                  //    print(file.path.toString());
                      signFile = file;
                    });
                  },
                  child: Container(
                    width: 100,
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Text('Upload File',
                            style: TextStyle(fontSize: 10))),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor)),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonButton(
                    buttonColor: AppColors.primaryColor,
                    titleColor: Colors.white,
                    title: "Save next",
                    onTap: () {
                     
                    // Navigator.pushNamed(context, RouterName.pickupAddress);
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        if (docFile != null && signFile != null) {
                          _uploadDocument(context);
                        } else {
                          Fluttertoast.showToast(
                              backgroundColor: AppColors.primaryColor,
                              msg: "Please Upload File");
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _uploadDocument(BuildContext context) async {
    SellRepository.uploadDocuments(docFile, signFile, id.toString(), gstNumber).then((id){
     if(id !=null){
     Navigator.pushReplacementNamed(context, RouterName.pickupAddress,arguments: id.toString());
     }
    }).catchError((e){
         showMessagess('Error');

    });
  }
}