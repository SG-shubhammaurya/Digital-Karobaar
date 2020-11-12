import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'common_alert_box.dart';
typedef void OnUploadCallback(File file);

class CommonAlertBox {
  static Future<File> selectFile;
  
  static Future takeImageFromCamera(BuildContext context,{OnUploadCallback onUploadCallback}) async {
    return commonAlertBox(context, onPressed: (fromCamera) {
      if (fromCamera) {
        try {
          selectFile = ImagePicker.pickImage(source: ImageSource.camera,imageQuality: 85)
              .whenComplete(() {
            Navigator.pop(context);
          });
 selectFile.then((value) {
            onUploadCallback(value);
           
            //upload file here..
          }).catchError((e) {});
        } catch (e) {}
      }
      if (fromCamera == false) {
        try {
          selectFile = ImagePicker.pickImage(source: ImageSource.gallery)
              .whenComplete(() {
            Navigator.pop(context);
          });

          // if (uploadedFile!= null) {

          selectFile.then((value) {
            onUploadCallback(value);
         
          }).catchError((e) {});

          // }
        } catch (e) {}
      }
    });
  }
}
