import 'dart:io';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/core/widget/common_upload_file_alert.dart';
import 'package:digitalkarobaar/src/models/categories.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/repository/sell_respository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/res/app_text_style.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandsMov extends StatefulWidget {
  final id;
  BrandsMov(this.id);
  @override
  _BrandsMovState createState() => _BrandsMovState();
}

class _BrandsMovState extends State<BrandsMov> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final days = ['Same Day', '3 day', '4 day', '5 day'];

  final weeks = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  final type = ['Registered', 'Not Registered'];
  final brandType = ['Brand Registration', 'No Objection Certificate'];
  TextEditingController brandName = TextEditingController();
  TextEditingController categoriesController = TextEditingController();
  TextEditingController uploadFile = TextEditingController();
  File imageFile;
  bool isNewBrandUpdated = false;
  @override
  void initState() {
    if (widget.id == null) {
      isNewBrandUpdated = true;
    }
    _getCategories();
    super.initState();
  }

  List<Categories> categories = [];
  bool isLoading = true;
  _getCategories() async {
    final getCategories = await HomeReposiitory.getCategories();
    setState(() {
      categories = getCategories;
      if (categories != null) {
        isLoading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isNewBrandUpdated ? Text('Add New Brand') : Text('Brands & MOV'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // FlatButton(
              //     shape: RoundedRectangleBorder(
              //         side: BorderSide(color: AppColors.primaryColor)),
              //     onPressed: () {
              //       _showAddDialog(context);
              //     },
              //     child: Text(' + Add New Brand Name')),
              //  const SizedBox(height: 20),
              // _buildTable(),
              Text('Brand Name', style: GoogleFonts.poppins(fontSize: 12)),
              TextFormField(
                  autofocus: true,
                  controller: brandName,
                  keyboardType: TextInputType.text,
                  onSaved: (holder) {
                    brandName.text = holder;
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return "This is Required";
                    }
                    return null;
                  },
                  onChanged: (val) {},
                  textInputAction: TextInputAction.next,
                  decoration: inputDecoration(hint: "Enter Brand Name")),

              const SizedBox(height: 10),
              Text('Categories', style: GoogleFonts.poppins(fontSize: 12)),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : DropdownButtonFormField<String>(
                      value: null,
                      autofocus: true,
                      onSaved: (val) {
                        categoriesController.text = val;
                      },
                      items: categories.map((e) {
                        return DropdownMenuItem<String>(
                            value: e.title,
                            child: Text(
                              e.title,
                              style: TextStyle(fontSize: 14),
                            ));
                      }).toList(),
                      onChanged: (val) {
                        categoriesController.text = val;
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return "This is Required";
                        }
                        return null;
                      },
                      decoration: inputDecoration(hint: 'Categories'),
                    ),
              const SizedBox(height: 10),
              TextFormField(
                readOnly: true,
                autofocus: true,
                keyboardType: TextInputType.text,
                controller: uploadFile,
                onSaved: (val) {},
                validator: (val) {
                  if (val.isEmpty) {
                    return "This is Required";
                  }
                  return null;
                },
                decoration: inputDecoration(hint: 'Upload Image File'),
                onTap: () {
                  CommonAlertBox.takeImageFromCamera(context,
                      onUploadCallback: (file) {
                  //  print(file.path.toString());
                    setState(() {
                      imageFile = file;
                      uploadFile.text = file.path;
                    });
                  });
                },
              ),
              // const SizedBox(height: 10),
              // Text('Set your Min Order Value',style: GoogleFonts.poppins(
              //   fontSize: 12
              // )),
              // const SizedBox(height: 10),
              // DropdownButtonFormField<String>(
              //   value: null,
              //   items: days.map((e) {
              //     return DropdownMenuItem<String>(
              //         value: e.toString(),
              //         child: Text(
              //           e.toString(),
              //           style: TextStyle(fontSize: 14),
              //         ));
              //   }).toList(),
              //   onChanged: (val) {},
              //   validator: (val) {
              //     if (val.isEmpty) {
              //       return "This is Required";
              //     }
              //     return null;
              //   },
              //   decoration: inputDecoration(hint: 'Dispatch Time'),
              // ),
              // const SizedBox(height: 10),
              // Text('Minimum Order Value should be 500 or greater than 500',style: GoogleFonts.poppins(
              //   fontSize: 12
              // )),
              // const SizedBox(height: 10),
              // const Text('Set dispatch days'),
              // const SizedBox(height: 10),
              // DropdownButtonFormField<String>(
              //   value: null,
              //   items: weeks.map((e) {
              //     return DropdownMenuItem<String>(
              //         value: e.toString(),
              //         child: Text(
              //           e.toString(),
              //           style: TextStyle(fontSize: 14),
              //         ));
              //   }).toList(),
              //   onChanged: (val) {},
              //   validator: (val) {
              //     if (val.isEmpty) {
              //       return "This is Required";
              //     }
              //     return null;
              //   },
              //   decoration: inputDecoration(hint: 'Please Select'),
              // ),
              // const SizedBox(height: 10),
              // const Text('Set non working days'),
              // const SizedBox(height: 10),
              // Text(
              //   'Your buyer will be able to buy these minimum order value from your shop',
              //   style: TextStyle(fontSize: 14),
              // ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonButton(
                      buttonColor: AppColors.primaryColor,
                      titleColor: Colors.white,
                      title: isNewBrandUpdated ? 'save Update' : "Save next",
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          SellRepository.uploadMov(imageFile, brandName.text,
                                  categoriesController.text)
                              .then((value) {
                            if (value?.statusCode == 200) {
                              if(!isNewBrandUpdated){
                                showMessagess('Brand Updated');
                                 Navigator.pushReplacementNamed(
                                  context, RouterName.submitForm);

                              }
                             
                            }
                          }).catchError((e) {
                            showMessagess('Error');
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

  // _buildTable() {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: DataTable(
  //       columnSpacing: 5,
  //       columns: const <DataColumn>[
  //         DataColumn(
  //           label: Text(
  //             'Brand Name',
  //             style: TextStyle(fontStyle: FontStyle.italic),
  //           ),
  //         ),
  //         DataColumn(
  //           label: Text(
  //             'Type',
  //             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
  //           ),
  //         ),
  //         DataColumn(
  //           label: Text(
  //             'Document Submitted',
  //             style: TextStyle(fontStyle: FontStyle.italic),
  //           ),
  //         ),
  //         DataColumn(
  //           label: Text(
  //             'Approval Status',
  //             style: TextStyle(fontStyle: FontStyle.italic),
  //           ),
  //         ),
  //         DataColumn(
  //           label: Text(
  //             'App Status',
  //             style: TextStyle(fontStyle: FontStyle.italic),
  //           ),
  //         ),
  //       ],
  //       rows: <DataRow>[
  //         DataRow(
  //           cells: <DataCell>[
  //             DataCell(Text(brandName.text)),
  //             DataCell(Text('type')),
  //             DataCell(Text('N/A')),
  //             DataCell(Text('pending')),
  //             DataCell(Text('inactive')),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // _showAlert(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Choose Action'),
  //         content: ListView(
  //           shrinkWrap: true,
  //           children: [
  //             InkWell(
  //               // onTap: ()=>onPressed(false),
  //               child: Text("Gallery",
  //                   style: TextStyle(fontSize: 15, color: Colors.black54)),
  //             ),
  //             SizedBox(height: 10),
  //             InkWell(
  //                 //onTap: ()=>onPressed(true),
  //                 child: Text("Camera",
  //                     style: TextStyle(fontSize: 15, color: Colors.black54)))
  //           ],
  //         ),
  //         actions: [
  //           FlatButton(
  //             child: Text("Cancel"),
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

  // _showAddDialog(BuildContext context) => showDialog(
  //       context: context,
  //       builder: (context) {
  //         final _regType = Provider.of<RegisteredType>(context);
  //         final _brandType = Provider.of<BrandType>(context);
  //         return AlertDialog(
  //           title: Text(""),
  //           content: SingleChildScrollView(
  //             child: Container(
  //               width: double.infinity,
  //               child: Column(
  //                 //  mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   TextFormField(
  //                     keyboardType: TextInputType.text,
  //                     controller: brandName,
  //                     decoration: InputDecoration(
  //                       hintText: 'Your Brand Name',
  //                     ),
  //                   ),
  //                   FlatButton(onPressed: () {}, child: Text('verify')),
  //                   TextFormField(
  //                     readOnly: true,
  //                     keyboardType: TextInputType.text,
  //                     // controller: uploadFile,
  //                     decoration: InputDecoration(
  //                       hintText: 'Upload Image File',
  //                     ),
  //                     onTap: () {
  //                       CommonAlertBox.takeImageFromCamera(context,
  //                           onUploadCallback: (file) {
  //                         print(file.path.toString());
  //                         setState(() {
  //                           //uploadFile.text = file.path;
  //                         });
  //                       });
  //                     },
  //                   ),
  //                   SizedBox(height: 10),
  //                   Column(
  //                       children: type
  //                           .map((e) => RadioListTile(
  //                               value: e,
  //                               title: Text(e, style: TextStyle(fontSize: 12)),
  //                               groupValue: _regType.type,
  //                               selected: _regType.type == e,
  //                               onChanged: (val) {
  //                                 _regType.update(val);
  //                               }))
  //                           .toList()),
  //                   _regType.type == "Registered"
  //                       ? Column(
  //                           children: brandType
  //                               .map((e) => RadioListTile(
  //                                   value: e,
  //                                   title: Text(
  //                                     e,
  //                                     style: TextStyle(fontSize: 12),
  //                                   ),
  //                                   groupValue: _brandType.brandType,
  //                                   selected: _brandType.brandType == e,
  //                                   onChanged: (val) {
  //                                     _brandType.updateBrandType(val);
  //                                   }))
  //                               .toList())
  //                       : SizedBox(),
  //                   _regType.type == "Registered"
  //                       ? TextFormField(
  //                           readOnly: true,
  //                           keyboardType: TextInputType.text,
  //                           //controller: uploadBrandFile,
  //                           onTap: () {
  //                             CommonAlertBox.takeImageFromCamera(context,
  //                                 onUploadCallback: (file) {
  //                               print(file.path.toString());
  //                               setState(() {
  //                                 // uploadBrandFile.text = file.path;
  //                               });
  //                             });
  //                           },
  //                           decoration: InputDecoration(
  //                             hintText: 'Upload Image File',
  //                           ),
  //                         )
  //                       : SizedBox(),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           actions: [
  //             FlatButton(
  //               child: Text("Cancel"),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //             RaisedButton(
  //               child: Text("Save"),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         );
  //       },
  //     );
}

class RegisteredType extends ChangeNotifier {
  String _type = '';
  RegisteredType();

  String get type => _type;

  update(String value) {
    if (value != _type) {
      _type = value;
      notifyListeners();
    }
  }
}
