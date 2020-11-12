

import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/core/widget/no_data_available.dart';
import 'package:digitalkarobaar/src/models/seller_document.dart';
import 'package:digitalkarobaar/src/repository/dashboard_repository.dart';
import 'package:flutter/material.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

class BusinessProfile extends StatefulWidget {
  @override
  _BusinessProfileState createState() => _BusinessProfileState();
}

class _BusinessProfileState extends State<BusinessProfile> {
  SellerDocument sellerDocument;

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _getSellerDocument();
    super.initState();
  }

  _getSellerDocument() async {
    sellerDocument =  SellerDocument(data: []);
    var document = await DashRepository.getSellerDocument()
    .catchError((e){setState(() {
        isLoading = false;
      });});
    if (document != null) {
      sellerDocument = document;
      setState(() {
        isLoading = false;
      });
    }else{
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(LanguageKeys.businessProfile.translate(context))),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            :  sellerDocument.data.length == 0
                ? Center(child: NoDataAvailable(message: " Profile Not Available"))
         
            : Column(
                children: [
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
                                sellerDocument.data[index].document,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        );
                      }),
                ],
              ));
  }
}
