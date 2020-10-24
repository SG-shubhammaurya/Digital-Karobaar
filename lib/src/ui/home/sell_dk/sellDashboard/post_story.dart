import 'dart:io';

import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/core/widget/common_upload_file_alert.dart';
import 'package:digitalkarobaar/src/repository/dashboard_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/res/app_text_style.dart';
import 'package:flutter/material.dart';

class PostStory extends StatefulWidget {
  @override
  _PostStoryState createState() => _PostStoryState();
}

class _PostStoryState extends State<PostStory> {
  TextEditingController image = TextEditingController();
  // TextEditingController video = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File imageFile;
  // File videoFile;
  var _message;
  bool isUploading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Post  Story'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 10),

              Container(
                height: 100,
                child: TextFormField(
                  expands: true,
                  maxLines: null,
                    validator: (val) {
                      if (val.length == 0) {
                        return "This is Required";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      _message = val;
                    },
                    keyboardType: TextInputType.multiline,
                    decoration:InputDecoration(
                             hintStyle: TextStyle(
                               fontSize: 12
                             ),
        hintText:"Write Somthing here",
     
      //contentPadding:
       //  EdgeInsets.only(bottom: 20),
    
        // border: InputBorder.none,
        disabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 2,color: AppColors.primaryColor)) ,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 2,color: AppColors.primaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 2,color: AppColors.primaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide( color: AppColors.primaryColor)
       )
                      
          ),),
              ),
                  // inputDecoration(hint: "")),
              const SizedBox(height: 10),
              TextFormField(
                readOnly: true,
                keyboardType: TextInputType.text,
                controller: image,
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
                    if (file != null) {
                      setState(() {
                        imageFile = file;
                        image.text = file.path.split('/').last;
                      });
                    }
                  });
                },
              ),
              const SizedBox(height: 10),
              // TextFormField(
              //   readOnly: true,
              //   keyboardType: TextInputType.text,
              //   controller: video,
              //   validator: (val) {
              //     if (val.length == 0) {
              //       return "This is Required";
              //     }
              //     return null;
              //   },
              //   decoration: inputDecoration(hint: "Upload Video"),
              //   onTap: () {
              //     CommonAlertBox.takeImageFromCamera(context,
              //         onUploadCallback: (file) {
              //      if(file !=null){
              //         setState(() {
              //           videoFile = file;
              //         video.text = file.path.split('/').last;
              //       });
              //      }
              //     });
              //   },
              // ),
              const SizedBox(height: 10),
              CommonButton(
                  buttonColor: AppColors.primaryColor,
                  titleColor: Colors.white,
                  title: 'Post',
                  onTap: () {
                    _formKey.currentState.save();
                    setState(() {
                      isUploading = true;
                    });
                    DashRepository.uploadStory(imageFile, _message)
                        .whenComplete(() {
                      setState(() {
                        isUploading = false;
                      });
                    });
                  }),
              const SizedBox(height: 10),

              isUploading
                  ? SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        backgroundColor: AppColors.primaryColor,
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
