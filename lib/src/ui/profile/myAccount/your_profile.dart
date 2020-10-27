import 'dart:io';

import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/core/widget/common_upload_file_alert.dart';
import 'package:digitalkarobaar/src/models/seller_profile.dart';
import 'package:digitalkarobaar/src/repository/dashboard_repository.dart';
import 'package:digitalkarobaar/src/repository/sell_respository.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

class YourProfile extends StatefulWidget {
  @override
  _YourProfileState createState() => _YourProfileState();
}

class _YourProfileState extends State<YourProfile> {
  SellerProfile sellerProfile;
  bool isLoading = true;

  @override
  void initState() {
    _getSellerProfile();
    super.initState();
  }

  _getSellerProfile() async {
    var profile = await SellRepository.getSellerProfileInfo();
    if (profile != null) {
      sellerProfile = profile;
      setState(() {
        isLoading = false;
      });
    }
  }
 File file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(LanguageKeys.yourProfile.translate(context))),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: sellerProfile.seller.length,
                itemBuilder: (c, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: InkWell(
                                onTap: () {
                                  CommonAlertBox.takeImageFromCamera(context,
                                      onUploadCallback: (uploadfile) {
                                    if (uploadfile != null) {
                                      setState(() {
                                        file=uploadfile;
                                      });
                                      DashRepository.sellerPicUpdate(uploadfile);
                                    }
                                  });
                                },
                                child: Stack(
                                  children: [
                                file !=null ?   ClipOval(
                                clipBehavior: Clip.antiAlias,
                                child: Image.file(
                                 file,
                                  height: 80,
                                  width: 80,
                                ),
                              ):
                                    CircleAvatar(
                                      radius: 60,
                                      backgroundImage: NetworkImage(
                                          sellerProfile.seller[index].profile),
                                    ),
                                    Positioned(
                                        bottom: 20,
                                        right: 5,
                                        child: Icon(
                                          Icons.camera_alt,
                                          size: 16,
                                        )),
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                itemCount: sellerProfile.detail.length,
                                itemBuilder: (c, i) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _buildDescription('Name',
                                            sellerProfile.detail[index].name),
                                        _buildDescription(
                                            'Company Name',
                                            sellerProfile
                                                .detail[index].companyName),
                                        _buildDescription(
                                            'address1',
                                            sellerProfile
                                                .detail[index].address1),
                                        _buildDescription(
                                            'address1',
                                            sellerProfile
                                                .detail[index].address2),
                                        _buildDescription(
                                            'PinCode',
                                            sellerProfile.detail[index].pinCode
                                                .toString()),
                                        _buildDescription('State',
                                            sellerProfile.detail[index].state),
                                        _buildDescription('City',
                                            sellerProfile.detail[index].city),
                                      ],
                                    ),
                                  );
                                })
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Text('Phone Number'),
                        SizedBox(height: 10.0),
                        Text(
                          '+91-${sellerProfile.seller[index].phoneNo}',
                          style: TextStyle(fontSize: 15),
                        ),
                        _buildDescription(
                            'Status', sellerProfile.seller[index].status),
                        // Row(
                        //   children: [
                        //     Text(sellerProfile.seller[index].premium.toString(),
                        //         style: TextStyle(fontSize: 15)),
                        //   ],
                        // ),
                      ],
                    ),
                  );
                }));
  }

  _buildDescription(String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Divider(color:Colors.black12),
        Text(title, style: GoogleFonts.poppins(fontSize: 15)),
        SizedBox(height: 8.0),
     
        Text(subTitle, style: TextStyle(fontSize: 14)),
           Divider(color:Colors.black12),
      ],
    );
  }
}
