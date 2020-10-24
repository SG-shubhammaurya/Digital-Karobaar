import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/core/widget/common_upload_file_alert.dart';
import 'package:digitalkarobaar/src/repository/sell_respository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/res/app_text_style.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';

class BankDetails extends StatelessWidget {
  final id;
  BankDetails(this.id);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var ifsCode;
  var acNumber;
  var holderName;
  var bankName;
  var cancelCheque;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Text('Branch IFSC Code'),
              const SizedBox(height: 10),
              TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  onSaved: (ifsc) {
                    ifsCode = ifsc;
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return "This is Required";
                    }
                    return null;
                  },
                  onChanged: (val) {},
                  textInputAction: TextInputAction.next,
                  decoration: inputDecoration(hint: "Enter ifsc code")),
              const SizedBox(height: 20),
              const Text('Bank Account Number '),
              const SizedBox(height: 10),
              TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  onSaved: (acno) {
                    acNumber = acno;
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return "This is Required";
                    }
                    return null;
                  },
                  onChanged: (val) {},
                  textInputAction: TextInputAction.next,
                  decoration: inputDecoration(hint: "Enter account Number")),
              SizedBox(height: 20),
              Text('Beneficiary name'),
              const SizedBox(height: 10),
              TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  onSaved: (holder) {
                    holderName = holder;
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return "This is Required";
                    }
                    return null;
                  },
                  onChanged: (val) {},
                  textInputAction: TextInputAction.next,
                  decoration: inputDecoration(hint: "Enter account holder name")),
              SizedBox(height: 20),
              Text('Bank Name'),
              const SizedBox(height: 10),
              TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  onSaved: (name) {
                    bankName = name;
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return "This is Required";
                    }
                    return null;
                  },
                  onChanged: (val) {},
                  textInputAction: TextInputAction.next,
                  decoration: inputDecoration(hint: "Enter bank Name")),
              SizedBox(height: 20),
              Text('Cancelled Cheque'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      CommonAlertBox.takeImageFromCamera(context,
                          onUploadCallback: (file) {
                        print(file.path.toString());
                        cancelCheque = file;
                      });
                    },
                    child: Container(
                      width: 100,
                      padding: EdgeInsets.all(5),
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
                    onTap: () {
                      CommonAlertBox.takeImageFromCamera(context,
                          onUploadCallback: (file) {
                        print(file.path.toString());
                        cancelCheque = file;
                      });
                    },
                    child: Container(
                      width: 100,
                      padding: EdgeInsets.all(5),
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
                      title: "Svae next",
                      onTap: () {
                   //   Navigator.pushNamed(context, RouterName.brandsMov);
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          SellRepository.uploadBankDetails(cancelCheque, ifsCode, acNumber, holderName, bankName,id).then((value) {
                              Navigator.pushReplacementNamed(context, RouterName.brandsMov,arguments: value.toString());
                          });
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
