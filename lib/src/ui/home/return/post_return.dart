import 'dart:io';

import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/core/widget/common_upload_file_alert.dart';
import 'package:digitalkarobaar/src/repository/order_return_repo.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/res/app_text_style.dart';
import 'package:flutter/material.dart';

class PostReturn extends StatefulWidget {
  @override
  _PostReturnState createState() => _PostReturnState();
}

class _PostReturnState extends State<PostReturn> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController fileUpload = TextEditingController();

  var message;
  bool isUploading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Return Post'),
      ),
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                  validator: (val) {
                    if (val.length == 0) {
                      return "This is Required";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    message = val;
                  },
                  keyboardType: TextInputType.text,
                  decoration: inputDecoration(hint: "Message")),
              const SizedBox(height: 10),
              TextFormField(
                readOnly: true,
                keyboardType: TextInputType.text,
                controller: fileUpload,
                validator: (val) {
                  if (val.length == 0) {
                    return "This is Required";
                  }
                  return null;
                },
                decoration: inputDecoration(hint: "Upload Image"),
                onTap: () {
                  CommonAlertBox.takeImageFromCamera(context,
                      onUploadCallback: (file) {
                    print(file.path.toString());
                    setState(() {
                      fileUpload.text = file.path;
                    });
                  });
                },
              ),
              const SizedBox(height: 10),
              CommonButton(
                buttonColor: AppColors.primaryColor,
                titleColor: Colors.white,
                title: 'Upload',
                onTap: () {
                  if (_key.currentState.validate()) {
                    _key.currentState.save();
                    setState(() {
                        isUploading = true;
                      });
                    OrderReturnRepo()
                        .returnPost(fileUpload.text, message, "31")
                        .whenComplete(() {
                      setState(() {
                        isUploading = false;
                      });
                    }).catchError((e) {
                      setState(() {
                        isUploading = false;
                      });
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              isUploading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        backgroundColor: AppColors.primaryColor,
                      ),
                    )
                  : SizedBox(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
