import 'dart:io';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/core/widget/common_upload_file_alert.dart';
import 'package:digitalkarobaar/src/core/widget/no_data_available.dart';
import 'package:digitalkarobaar/src/models/seller_document.dart';
import 'package:digitalkarobaar/src/repository/dashboard_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/res/app_text_style.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SellerSetting extends StatefulWidget {
  @override
  _SellerSettingState createState() => _SellerSettingState();
}

class _SellerSettingState extends State<SellerSetting> {
  var gstNumber;
  File docFile;
  File signFile;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SellerDocument sellerDocument;

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _getSellerDocument();
    super.initState();
  }

  _getSellerDocument() async {
    sellerDocument = SellerDocument(data: []);
    var document = await DashRepository.getSellerDocument().catchError((e) {
      setState(() {
        isLoading = false;
      });
    });
    if (document != null) {
      sellerDocument = document;
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  bool isuploading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageKeys.sellerSetting.translate(context)),
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
                  maxLength: 15,
                  keyboardType: TextInputType.text,
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
                      docFile = file;
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 50.0,
                    padding: const EdgeInsets.all(8),
                    child: ListView(children: [
                      isLoading
                          ? Center(child: CircularProgressIndicator())
                          : sellerDocument.data.length == 0
                              ? Center(
                                  child:
                                      NoDataAvailable(message: "No Available"))
                              : Column(children: [
                                  ListView.builder(
                                      itemCount: sellerDocument.data.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            SizedBox(
                                              height: 100.0,
                                            ),
                                            Container(
                                              height: 200,
                                              width: 250,
                                              child: Image.network(
                                                sellerDocument
                                                    .data[index].document,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ],
                                        );
                                      })
                                ])
                    ]),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor)),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    try {
                      await CommonAlertBox.takeImageFromCamera(context,
                          onUploadCallback: (file) {
                        docFile = file;
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          if (docFile != null) {
                            _uploadDocument(context);
                          } else {
                            Fluttertoast.showToast(
                                backgroundColor: AppColors.primaryColor,
                                msg: "Please Upload File");
                          }
                        }
                      });
                    } catch (e) {}
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
                        if (signFile != null) {
                          signFile = file;
                        }
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 50.0,
                      padding: const EdgeInsets.all(8),
                      child: ListView(children: [
                        isLoading
                            ? Center(child: CircularProgressIndicator())
                            : sellerDocument.data.length == 0
                                ? Center(
                                    child: NoDataAvailable(
                                        message: "No Available"))
                                : Column(children: [
                                    ListView.builder(
                                        itemCount: sellerDocument.data.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: 100.0,
                                              ),
                                              Container(
                                                height: 200,
                                                width: 250,
                                                child: Image.network(
                                                  sellerDocument
                                                      .data[index].sign,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ],
                                          );
                                        })
                                  ])
                      ]),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor)),
                    )),
                InkWell(
                  onTap: () async {
                    await CommonAlertBox.takeImageFromCamera(context,
                        onUploadCallback: (file) {
                      signFile = file;
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        if (signFile != null) {
                          _uploadSign(context);
                        } else {
                          Fluttertoast.showToast(
                              backgroundColor: AppColors.primaryColor,
                              msg: "Please Upload File");
                        }
                      }
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
            const SizedBox(height: 50),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonButton(
                    buttonColor: AppColors.primaryColor,
                    titleColor: Colors.white,
                    title: LanguageKeys.saveAndVerify.translate(context),
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        if (docFile != null && signFile != null) {
                          _updateDocument(context);
                        } else {
                          Fluttertoast.showToast(
                              backgroundColor: AppColors.primaryColor,
                              msg: "Please Upload File");
                        }
                      }
                    },
                  ),

                   isuploading ? Center(child: CircularProgressIndicator()) : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _uploadDocument(BuildContext context) async {
    
    //DashRepository.uploadDocument(docFile)
  }

  _uploadSign(BuildContext context) async {
  
    //DashRepository.updateSign(signFile)
  }

  _updateDocument(BuildContext context) async {
    setState(() {
      isuploading = true;
    });
    DashRepository.updateDocument(docFile, signFile, gstNumber).then((value) {
      setState(() {
        isuploading = false;
      });
      Navigator.pushReplacementNamed(context, RouterName.myAccount);
    });
  }
}
