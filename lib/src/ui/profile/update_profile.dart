// import 'dart:io';
// import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
// import 'package:digitalkarobaar/src/core/utils/util.dart';
// import 'package:digitalkarobaar/src/core/widget/common_button.dart';
// import 'package:digitalkarobaar/src/core/widget/common_upload_file_alert.dart';
// import 'package:digitalkarobaar/src/models/user_profile.dart';
// import 'package:digitalkarobaar/src/repository/home_repository.dart';
// import 'package:digitalkarobaar/src/res/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class UpdateProfile extends StatefulWidget {
//   @override
//   _UpdateProfileState createState() => _UpdateProfileState();
// }

// class _UpdateProfileState extends State<UpdateProfile> {
//   //var _pincode;
//   String _name;
//   String _business;
//   String _pincode;
//   String _email;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController name = TextEditingController();
//   TextEditingController business = TextEditingController();
//   TextEditingController pincode = TextEditingController();
//   TextEditingController email = TextEditingController();
//   Widget _buildName() {
//     return TextFormField(
//         controller: name,
//         decoration: InputDecoration(
//           labelText: "Name",
//         ),
//         keyboardType: TextInputType.text,
//         validator: (String value) {
//           if (value.isEmpty) {
//             return 'this is Required';
//           }
//           return null;
//         },
//         onSaved: (String value) {
//           _name = value;
//         });
//   }

//   Widget _buildPinCode() {
//     return TextFormField(
//         controller: pincode,
//         decoration: InputDecoration(labelText: "Pincode"),
//         keyboardType: TextInputType.number,
//         validator: (String value) {
//           if (value.isEmpty) {
//             return 'this is Required';
//           }
//           return null;
//         },
//         onSaved: (String value) {
//           _pincode = value;
//         });
//   }

//   Widget _buildMailId() {
//     return TextFormField(
//         decoration: InputDecoration(labelText: "Email-id"),
//         keyboardType: TextInputType.emailAddress,
//         controller: email,
//         validator:(val) => Util .validateEmail(val),
//         onSaved: (String value) {
//           _email = value;
//         });
//   }

//   Widget _buildBusiness() {
//     return TextFormField(
//         controller: business,
//         decoration: InputDecoration(labelText: "Business"),
//         keyboardType: TextInputType.text,
//         validator: (String value) {
//           if (value.isEmpty) {
//             return 'This is Required';
//           }
//           return null;
//         },
//         onSaved: (String value) {
//           _business = value;
//         });
//   }

//   @override
//   void initState() {
//     _getUserDetails();
//     super.initState();
//   }

//   File selectFile;
//   bool _isLoading = false;
//   UserProfile userProfile;
//   _getUserDetails() async {
//     userProfile = UserProfile();
//     try {
//       var profile = await HomeReposiitory.getProfileInfo();
//       setState(() {
//         if (userProfile != null) {
//           userProfile = profile;
//           name.text = userProfile.name;
//           pincode.text = userProfile.pinCode.toString();
//           email.text = userProfile.email;
//           business.text = userProfile.business;
//         }
//       });
//     } catch (e) {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "Edit Profile",
//           style: TextStyle(color: Colors.white, fontSize: 15),
//         ),
//       ),
//       body: ListView(
//         children: <Widget>[
//           SizedBox(height: 10),
//           Stack(
//               alignment: Alignment.center,
//               clipBehavior: Clip.antiAlias,
//               fit: StackFit.loose,
//               children: [
//                 userProfile.profilePic != null
//                     ? ClipOval(
//                         clipBehavior: Clip.antiAlias,
//                         child: CircleAvatar(
//                               minRadius: 30,
//                               maxRadius: 40,
//                             ) ??
//                             Image.network(
//                               userProfile.profilePic,
//                               height: 80,
//                               width: 80,
//                             ),
//                       )
//                     : selectFile != null
//                         ? ClipOval(
//                             clipBehavior: Clip.antiAlias,
//                             child: Image.file(
//                               selectFile,
//                               height: 80,
//                               width: 80,
//                             ),
//                           )
//                         : CircleAvatar(
//                             minRadius: 30,
//                             maxRadius: 40,
//                           ),
//                 Positioned(
//                     top: 30,
//                     left: 75,
//                     right: 5,
//                     child: IconButton(
//                         icon: Icon(Icons.photo_camera,color: AppColors.primaryColor,),
//                         onPressed: () {
//                           CommonAlertBox.takeImageFromCamera(context,
//                               onUploadCallback: (uploadfile) {
//                             if (uploadfile != null) {
//                               setState(() {
//                                 selectFile = uploadfile;
//                               });
//                               HomeReposiitory.profilePic(uploadfile).catchError((e){
//                                 showMessagess('Failed To Upload');
//                               });
//                             }
//                           });
//                           // _takeImageFromCamera(context);
//                         }))
//               ]),
//           SizedBox(height: 10.0),
//           Container(
//               child: Form(
//                   key: _formKey,
//                   child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 40),
//                       child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             _buildName(),
//                             _buildPinCode(),
//                             _buildMailId(),
//                             _buildBusiness(),
//                             SizedBox(height: 20),
//                             CommonButton(
//                               title: "save",
//                               buttonColor: AppColors.primaryColor,
//                               height: 35,
//                               onTap: () {
//                                 if(  _formKey.currentState.validate()){
//                                     _formKey.currentState.save();
//                                    setState(() {
//                                   _isLoading = true;
//                                 });
//                                 HomeReposiitory.updateProfile(
//                                         _name,  _business,_pincode, _email)
//                                     .then((value) {
//                                   setState(() {
//                                     _isLoading = false;
//                                   });
//                                   Fluttertoast.showToast(
//                                       backgroundColor: AppColors.primaryColor,
//                                       textColor: Colors.red,
//                                       msg: value);
//                                 }).catchError((e) {
//                                   setState(() {
//                                     _isLoading = false;
//                                   });
//                                   Fluttertoast.showToast(
//                                       backgroundColor: AppColors.primaryColor,
//                                       textColor: Colors.red,
//                                       msg: e.toString());
//                                 });
//                                 }
                              
                               
//                               },
//                             ),
//                             _isLoading
//                                 ? SizedBox(
//                                     height: 20,
//                                     width: 20,
//                                     child: CircularProgressIndicator(
//                                       backgroundColor: AppColors.primaryColor,
//                                     ),
//                                   )
//                                 : SizedBox()
//                           ]))))
//         ],
//       ),
//     );
//   }
// }


// import 'dart:io';
// import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
// import 'package:digitalkarobaar/src/core/utils/util.dart';
// import 'package:digitalkarobaar/src/core/widget/common_button.dart';
// import 'package:digitalkarobaar/src/core/widget/common_upload_file_alert.dart';
// import 'package:digitalkarobaar/src/models/user_profile.dart';
// import 'package:digitalkarobaar/src/repository/home_repository.dart';
// import 'package:digitalkarobaar/src/res/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class UpdateProfile extends StatefulWidget {
//   @override
//   _UpdateProfileState createState() => _UpdateProfileState();
// }

// class _UpdateProfileState extends State<UpdateProfile> {
//   //var _pincode;
//   String _name;
//   String _business;
//   String _pincode;
//   String _email;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController name = TextEditingController();
//   TextEditingController business = TextEditingController();
//   TextEditingController pincode = TextEditingController();
//   TextEditingController email = TextEditingController();
//   Widget _buildName() {
//     return TextFormField(
//         controller: name,
//         decoration: InputDecoration(
//           labelText: "Name",
//         ),
//         keyboardType: TextInputType.text,
//         validator: (String value) {
//           if (value.isEmpty) {
//             return 'this is Required';
//           }
//           return null;
//         },
//         onSaved: (String value) {
//           _name = value;
//         });
//   }

//   Widget _buildPinCode() {
//     return TextFormField(
//         controller: pincode,
//         decoration: InputDecoration(labelText: "Pincode"),
//         keyboardType: TextInputType.number,
//         validator: (String value) {
//           if (value.isEmpty) {
//             return 'this is Required';
//           }
//           return null;
//         },
//         onSaved: (String value) {
//           _pincode = value;
//         });
//   }

//   Widget _buildMailId() {
//     return TextFormField(
//         decoration: InputDecoration(labelText: "Email-id"),
//         keyboardType: TextInputType.emailAddress,
//         controller: email,
//         validator:(val) => Util .validateEmail(val),
//         onSaved: (String value) {
//           _email = value;
//         });
//   }

//   Widget _buildBusiness() {
//     return TextFormField(
//         controller: business,
//         decoration: InputDecoration(labelText: "Business"),
//         keyboardType: TextInputType.text,
//         validator: (String value) {
//           if (value.isEmpty) {
//             return 'This is Required';
//           }
//           return null;
//         },
//         onSaved: (String value) {
//           _business = value;
//         });
//   }

//   @override
//   void initState() {
//     _getUserDetails();
//     super.initState();
//   }

//   File selectFile;
//   bool _isLoading = false;
//   UserProfile userProfile;
//   _getUserDetails() async {
//     userProfile = UserProfile();
//     try {
//       var profile = await HomeReposiitory.getProfileInfo();
//       setState(() {
//         if (userProfile != null) {
//           userProfile = profile;
//           name.text = userProfile.name;
//           pincode.text = userProfile.pinCode.toString();
//           email.text = userProfile.email;
//           business.text = userProfile.business;
//         }
//       });
//     } catch (e) {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "Edit Profile",
//           style: TextStyle(color: Colors.white, fontSize: 15),
//         ),
//       ),
//       body: ListView(
//         children: <Widget>[
//           SizedBox(height: 10),
//           Stack(
//               alignment: Alignment.center,
//               clipBehavior: Clip.antiAlias,
//               fit: StackFit.loose,
//               children: [
//                 userProfile.profilePic != null
//                     ? ClipOval(
//                         clipBehavior: Clip.antiAlias,
//                         child: CircleAvatar(
//                               minRadius: 30,
//                               maxRadius: 40,
//                             ) ??
//                             Image.network(
//                               userProfile.profilePic,
//                               height: 80,
//                               width: 80,
//                             ),
//                       )
//                     : selectFile != null
//                         ? ClipOval(
//                             clipBehavior: Clip.antiAlias,
//                             child: Image.file(
//                               selectFile,
//                               height: 80,
//                               width: 80,
//                             ),
//                           )
//                         : CircleAvatar(
//                             minRadius: 30,
//                             maxRadius: 40,
//                           ),
//                 Positioned(
//                     top: 30,
//                     left: 75,
//                     right: 5,
//                     child: IconButton(
//                         icon: Icon(Icons.photo_camera,color: AppColors.primaryColor,),
//                         onPressed: () {
//                           CommonAlertBox.takeImageFromCamera(context,
//                               onUploadCallback: (uploadfile) {
//                             if (uploadfile != null) {
//                               setState(() {
//                                 selectFile = uploadfile;
//                               });
//                               HomeReposiitory.profilePic(uploadfile).catchError((e){
//                                 showMessagess('Failed To Upload');
//                               });
//                             }
//                           });
//                           // _takeImageFromCamera(context);
//                         }))
//               ]),
//           SizedBox(height: 10.0),
//           Container(
//               child: Form(
//                   key: _formKey,
//                   child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 40),
//                       child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             _buildName(),
//                             _buildPinCode(),
//                             _buildMailId(),
//                             _buildBusiness(),
//                             SizedBox(height: 20),
//                             CommonButton(
//                               title: "save",
//                               buttonColor: AppColors.primaryColor,
//                               height: 35,
//                               onTap: () {
//                                 if(  _formKey.currentState.validate()){
//                                     _formKey.currentState.save();
//                                    setState(() {
//                                   _isLoading = true;
//                                 });
//                                 HomeReposiitory.updateProfile(
//                                         _name,  _business,_pincode, _email)
//                                     .then((value) {
//                                   setState(() {
//                                     _isLoading = false;
//                                   });
//                                   Fluttertoast.showToast(
//                                       backgroundColor: AppColors.primaryColor,
//                                       textColor: Colors.red,
//                                       msg: value);
//                                 }).catchError((e) {
//                                   setState(() {
//                                     _isLoading = false;
//                                   });
//                                   Fluttertoast.showToast(
//                                       backgroundColor: AppColors.primaryColor,
//                                       textColor: Colors.red,
//                                       msg: e.toString());
//                                 });
//                                 }
                              
                               
//                               },
//                             ),
//                             _isLoading
//                                 ? SizedBox(
//                                     height: 20,
//                                     width: 20,
//                                     child: CircularProgressIndicator(
//                                       backgroundColor: AppColors.primaryColor,
//                                     ),
//                                   )
//                                 : SizedBox()
//                           ]))))
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/core/widget/common_alert_box.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/core/widget/common_upload_file_alert.dart';
import 'package:digitalkarobaar/src/models/user_profile.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../res/app_colors.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  //var _pincode;
  String _name;
  String _business;
  String _pincode;
  String _email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController business = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController email = TextEditingController();
  Widget _buildName() {
    return TextFormField(
        controller: name,
        decoration: InputDecoration(
          labelText: "Name",
        ),
        keyboardType: TextInputType.text,
        validator: (String value) {
          if (value.isEmpty) {
            return 'this is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _name = value;
        });
  }

  Widget _buildPinCode() {
    return TextFormField(
        controller: pincode,
        decoration: InputDecoration(labelText: "Pincode"),
        keyboardType: TextInputType.number,
        validator: (String value) {
          if (value.isEmpty) {
            return 'this is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _pincode = value;
        });
  }

  Widget _buildMailId() {
    return TextFormField(
        decoration: InputDecoration(labelText: "Email-id"),
        keyboardType: TextInputType.emailAddress,
        controller: email,
        validator: (String value) {
          if (value.isEmpty) {
            return 'this is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _email = value;
        });
  }

  Widget _buildBusiness() {
    return TextFormField(
        controller: business,
        decoration: InputDecoration(labelText: "Business"),
        keyboardType: TextInputType.text,
        validator: (String value) {
          if (value.isEmpty) {
            return 'This is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _business = value;
        });
  }

  @override
  void initState() {
    _getUserDetails();
    super.initState();
  }

  File selectFile;
  bool _isLoading = false;
  UserProfile userProfile;
  _getUserDetails() async {
    userProfile = UserProfile();
    try {
      var profile = await HomeReposiitory.getProfileInfo();
      setState(() {
        if (userProfile != null) {
          userProfile = profile;
          name.text = userProfile.name;
          pincode.text = userProfile.pinCode.toString();
          email.text = userProfile.email;
          business.text = userProfile.business;
        }
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10),
          Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              fit: StackFit.loose,
              children: [
                userProfile.profilePic != null
                    ? ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: CircleAvatar(
                              minRadius: 30,
                              maxRadius: 50,
                              backgroundImage: NetworkImage(
                                userProfile.profilePic,
                              ),
                            )
                    )
                    //:
                    //  selectFile != null
                    //     ? ClipOval(
                    //         clipBehavior: Clip.antiAlias,
                    //         child: Image.file(
                    //           selectFile,
                    //           height: 80,
                    //           width: 80,
                    //         ),
                    //       )
                        : CircleAvatar(
                            minRadius: 30,
                            maxRadius: 50,
                          ),
                Positioned(
                    top: 60,
                    left: 85,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                    
                    child: IconButton(
                        icon: Icon(Icons.photo_camera),
                        onPressed: () {
                          CommonAlertBox.takeImageFromCamera(context,
                              onUploadCallback: (uploadfile) {
                            if (uploadfile != null) {
                              setState(() {
                                selectFile = uploadfile;
                              });
                              HomeReposiitory.profilePic(uploadfile).catchError((e){
                                showMessagess('Failed To Upload');
                              });
                            }
                          });
                          // _takeImageFromCamera(context);
                        }))
                        )
              ]),
          SizedBox(height: 10.0),
          Container(
              child: Form(
                  key: _formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _buildName(),
                            _buildPinCode(),
                            _buildMailId(),
                            _buildBusiness(),
                            SizedBox(height: 20),
                            CommonButton(
                              title: "save",
                              buttonColor: AppColors.primaryColor,
                              height: 35,
                              onTap: () {
                                if(  _formKey.currentState.validate()){
                                    _formKey.currentState.save();
                                   setState(() {
                                  _isLoading = true;
                                });
                                HomeReposiitory.updateProfile(
                                        _name,  _business,_pincode, _email)
                                    .then((value) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  Fluttertoast.showToast(
                                      backgroundColor: AppColors.primaryColor,
                                      textColor: Colors.red,
                                      msg: value);
                                }).catchError((e) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  Fluttertoast.showToast(
                                      backgroundColor: AppColors.primaryColor,
                                      textColor: Colors.red,
                                      msg: e.toString());
                                });
                                }
                              
                               
                              },
                            ),
                            _isLoading
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      backgroundColor: AppColors.primaryColor,
                                    ),
                                  )
                                : SizedBox()
                          ]))))
        ],
      ),
    );
  }
}

