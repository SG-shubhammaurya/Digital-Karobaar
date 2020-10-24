import 'dart:io';
import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/core/utils/util.dart';
import 'package:digitalkarobaar/src/core/widget/common_appbar.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

class ShopKyc extends StatefulWidget {
  @override
  _ShopKycState createState() => _ShopKycState();
}

class _ShopKycState extends State<ShopKyc> {
  double _progressValue = 0;
  int _progressPercentValue = 0;
  var documents = [];
  _init() {
    documents = [
      LanguageKeys.gstCertificate.translate(context),
      LanguageKeys.shopEstaLicense.translate(context),
      LanguageKeys.udhyogAadhar.translate(context),
      LanguageKeys.trade.translate(context),
      LanguageKeys.fssi.translate(context),
      LanguageKeys.drugLicense.translate(context),
      LanguageKeys.cAcheque.translate(context),
    ];
  }

  File kycFile;
  @override
  void initState() {
    _init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        appBar: CommonAppBar.commonAppBar("Shop KYC"),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: documents.length,
            itemBuilder: (c, index) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  index == 0
                      ? Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Text(
                            LanguageKeys.selectDocuments.translate(context),
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        )
                      : Text(''),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: ListTile(
                      title: Text(
                        documents[index],
                        style: TextStyle(fontSize: 15),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                  Divider()
                ],
              );
            }));
  }

  showAlertDialog(BuildContext context) {
    Widget onCancel = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text('Choose Action'),
      content: ListView(
        shrinkWrap: true,
        children: [
          InkWell(
            onTap: () {
              _uploadKyc(context);
              Navigator.pop(context);
            },
            child: Text("Gallery", style: TextStyle(fontSize: 15)),
          ),
          SizedBox(height: 10),
          InkWell(
              onTap: () {
                _fromCamera(context);
                Navigator.pop(context);
              },
              child: Text("Camera", style: TextStyle(fontSize: 15)))
        ],
      ),
      actions: [onCancel],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _uploadKyc(BuildContext context) async {
    try {
      File fileKyc = await FilePicker.getFile();
      _setUploadProgress(0, 0);

      if (fileKyc != null) {
        HomeReposiitory.uploadKyc(
            file: fileKyc,
            onUploadProgressCallback: (s, t) {
              _setUploadProgress(s, t);
            });
      }
    } catch (e) {
      Fluttertoast.showToast(
          textColor: Colors.red, msg: e.toString() ?? 'Failed');
      Navigator.pop(context);
    }
  }

  _fromCamera(BuildContext context) async {
    try {
      final pickedFile =
          await ImagePicker().getImage(source: ImageSource.camera);

      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        HomeReposiitory.uploadKyc(
            file: imageFile, onUploadProgressCallback: (s, t) {});
      }
    } catch (e) {}
  }

  void _setUploadProgress(int sentBytes, int totalBytes) {
    double __progressValue =
        Util.remap(sentBytes.toDouble(), 0, totalBytes.toDouble(), 0, 1);

    __progressValue = double.parse(__progressValue.toStringAsFixed(2));

    if (__progressValue != _progressValue)
      setState(() {
        _progressValue = __progressValue;
        _progressPercentValue = (_progressValue * 100.0).toInt();
      });
    showMessagess('Uploading $_progressPercentValue %');
  }
}
