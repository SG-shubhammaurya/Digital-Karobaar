import 'dart:convert';
import 'dart:io';
// import 'package:path/path.dart';
// import 'package:async/async.dart';

// import 'package:http/http.dart' as http;
import 'package:digitalkarobaar/src/bloc/productUpload/product_upload_bloc.dart';
import 'package:digitalkarobaar/src/bloc/productUpload/product_upload_state.dart';
import 'package:digitalkarobaar/src/core/endpoint/end_points.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/core/widget/common_upload_file_alert.dart';
import 'package:digitalkarobaar/src/models/image_responce.dart';
import 'package:digitalkarobaar/src/models/sub_categories.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/res/app_text_style.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductUpload extends StatefulWidget {
  @override
  _ProductUploadState createState() => _ProductUploadState();
}

class _ProductUploadState extends State<ProductUpload> {
  var productName;

  var categoriesName;

  var subCategoriesName;

  var brandsName;

  var disCount;

  var prize;
  var discription;
  var feature1;
  var feature2;

  var highlights1;
  var highlights2;
  var gst;
  var minOrder;

  ValueNotifier<String> _categoriesValue;
  ValueNotifier<String> _subcategoriesValue;
  ValueNotifier<String> _brands;

  List categories = <dynamic>[SubCategory(title: "")];
  List subCategories = <dynamic>[SubCategory(title: "")];
  List brands = <dynamic>[SubCategory(title: "")];

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _getCategories();
    super.initState();
  }

  var _selectedRadioTile;
  setSelectedRadioTile(String val) {
    setState(() {
      _selectedRadioTile = val;
    });
  }

  List<String> reportList = [
    "Red",
    "Blue",
    "Black",
    "Brown",
    ' yellow',
    'orange',
    'green',
    'white',
    'gold',
    'indigo',
    'violet',
    'silver',
    'purple',
    'pink',
    'grey/gray'
  ];
  TextEditingController controllerImage1 = TextEditingController();
  TextEditingController controllerImage2 = TextEditingController();
  TextEditingController controllerImage3 = TextEditingController();
  TextEditingController controllerImage4 = TextEditingController();
  TextEditingController controllerImage5 = TextEditingController();
  File image1;
  File image2;
  File image3;
  File image4;
  File image5;

  ProductUploadCubit uploadCubit;
  var getCategories;
  var getBrand;
  var getSubCategories;
  _getCategories() async {
    uploadCubit = context.bloc<ProductUploadCubit>();
    // getCategories = await;
    // getBrand = await uploadCubit.getBrands("");
  }

  var selectedSpecs = [];
  bool isUploading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageKeys.uploadYourProduct.translate(context)),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 20),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  TextFormField(
                      validator: (val) {
                        if (val.length == 0) {
                          return "This is Required";
                        }
                        return null;
                      },
                      onSaved: (name) {
                        productName = name;
                      },
                      keyboardType: TextInputType.text,
                      decoration: inputDecoration(hint: "Company Name")),
                  const SizedBox(height: 10),
                  BlocBuilder<ProductUploadCubit, ProductUploadState>(
                      cubit: uploadCubit..getCategories(''),
                      builder: (context, state) {
                        if (state is LoadingStateCategories) {
                          return SizedBox(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is GetCategories) {
                          categories = state.categories;
                          return _buildCategories(state.categories);
                        }

                        return _buildCategories(categories);
                      }),
                  const SizedBox(height: 10),
                  BlocBuilder<ProductUploadCubit, ProductUploadState>(
                      builder: (context, state) {
                    if (state is LoadingStateSubCategories) {
                      return SizedBox(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is GetSubCategories) {
                      subCategories = state.subCategories;
                      return _buildSubCategories(state.subCategories);
                    }

                    return _buildSubCategories(subCategories);
                  }),
                  const SizedBox(height: 10),
                  BlocBuilder<ProductUploadCubit, ProductUploadState>(
                      cubit: uploadCubit..getBrands(''),
                      builder: (context, state) {
                        if(state is LoadingStateBrand){
                           return CircularProgressIndicator();
                        }
                        if (state is GetBrandState) {
                          brands = state.brand;
                          return _buildBrands(state.brand);
                        }

                        return _buildBrands(brands);
                      }),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (val) {
                        if (val.length == 0) {
                          return "This is Required";
                        }
                      },
                      onSaved: (disc) {
                        disCount = disc;
                      },
                      keyboardType: TextInputType.text,
                      decoration:
                          inputDecoration(hint: "Price After Discount")),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (val) {
                        if (val.length == 0) {
                          return "This is Required";
                        }
                      },
                      onSaved: (onGst) {
                        gst = onGst;
                      },
                      keyboardType: TextInputType.number,
                      decoration: inputDecoration(hint: "GST")),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (val) {
                        if (val.length == 0) {
                          return "This is Required";
                        }
                      },
                      onSaved: (minBuy) {
                      minOrder= minBuy;
                      },
                      keyboardType: TextInputType.number,
                      
                      decoration: inputDecoration(hint: "Minimum order")),
                  const SizedBox(height: 10),
                  Text(
                    'Note: If you want 5% GST, then please write “5” only***',
                    style: TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    readOnly: true,
                    keyboardType: TextInputType.text,
                    controller: controllerImage1,
                    validator: (val) {
                      if (val.length == 0) {
                        return "This is Required";
                      }
                      return null;
                    },
                    decoration: inputDecoration(hint: "Upload Image1"),
                    onTap: () {
                      CommonAlertBox.takeImageFromCamera(context,
                          onUploadCallback: (file) {
                        print(file.path.toString());
                        setState(() {
                          image1 = file;
                          controllerImage1.text = image1.path;
                        });
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    readOnly: true,
                    keyboardType: TextInputType.text,
                    controller: controllerImage2,
                    validator: (val) {
                      if (val.length == 0) {
                        return "This is Required";
                      }
                      return null;
                    },
                    decoration: inputDecoration(hint: "Upload Image2"),
                    onTap: () {
                      CommonAlertBox.takeImageFromCamera(context,
                          onUploadCallback: (file) {
                        print(file.path.toString());
                        setState(() {
                          image2 = file;
                          controllerImage2.text = image2.path;
                        });
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    readOnly: true,
                    keyboardType: TextInputType.text,
                    controller: controllerImage3,
                    validator: (val) {
                      if (val.length == 0) {
                        return "This is Required";
                      }
                      return null;
                    },
                    decoration: inputDecoration(hint: "Upload Image3"),
                    onTap: () {
                      CommonAlertBox.takeImageFromCamera(context,
                          onUploadCallback: (file) {
                        print(file.path.toString());
                        setState(() {
                          image3 = file;
                          controllerImage3.text = image3.path;
                        });
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    readOnly: true,
                    keyboardType: TextInputType.text,
                    controller: controllerImage4,
                    validator: (val) {
                      if (val.length == 0) {
                        return "This is Required";
                      }
                      return null;
                    },
                    decoration: inputDecoration(hint: "Upload Image4"),
                    onTap: () {
                      CommonAlertBox.takeImageFromCamera(context,
                          onUploadCallback: (file) {
                        setState(() {
                          image4 = file;
                          controllerImage4.text = image4.path;
                        });
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    readOnly: true,
                    keyboardType: TextInputType.text,
                    controller: controllerImage5,
                    validator: (val) {
                      if (val.length == 0) {
                        return "This is Required";
                      }
                      return null;
                    },
                    decoration: inputDecoration(hint: "Upload Image5"),
                    onTap: () {
                      CommonAlertBox.takeImageFromCamera(context,
                          onUploadCallback: (file) {
                        setState(() {
                          image5 = file;
                          controllerImage5.text = image5.path;
                        });
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (val) {
                        if (val.length == 0) {
                          return "This is Required";
                        }
                      },
                      onSaved: (name) {
                        prize = name;
                      },
                      keyboardType: TextInputType.text,
                      decoration: inputDecoration(hint: "Prize in MRP")),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (val) {
                        if (val.length == 0) {
                          return "This is Required";
                        }
                      },
                      onSaved: (disname) {
                        discription = disname;
                      },
                      keyboardType: TextInputType.text,
                      decoration: inputDecoration(hint: "Description")),
                  const SizedBox(height: 10),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Color',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(height: 10),
                  MultiSelectChip(
                    reportList,
                    onSelectionChanged: (selectedList) {
                      setState(() {
                        selectedSpecs = selectedList;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Feature',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (val) {
                        if (val.length == 0) {
                          return "This is Required";
                        }
                        return null;
                      },
                      onSaved: (name) {
                        feature1 = name;
                      },
                      keyboardType: TextInputType.text,
                      decoration: inputDecoration(hint: "Feature1")),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (val) {
                        if (val.length == 0) {
                          return "This is Required";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        feature2 = val;
                      },
                      keyboardType: TextInputType.text,
                      decoration: inputDecoration(hint: "Feature2")),
                  const SizedBox(height: 10),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Highlights',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (val) {
                        if (val.length == 0) {
                          return "This is Required";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        highlights1 = val;
                      },
                      keyboardType: TextInputType.text,
                      decoration: inputDecoration(hint: "highlights1")),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (val) {
                        if (val.length == 0) {
                          return "This is Required";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        highlights2 = val;
                      },
                      keyboardType: TextInputType.text,
                      decoration: inputDecoration(hint: "highlights2")),
                  const SizedBox(height: 10),
                  RadioListTile(
                    value: '0',
                    groupValue: _selectedRadioTile,
                    title: Text("As seller"),
                    onChanged: (val) {
                      setSelectedRadioTile(val);
                    },
                    activeColor: Colors.orange,
                  ),
                  RadioListTile(
                    value: '1',
                    groupValue: _selectedRadioTile,
                    title: Text("As Member"),
                    onChanged: (val) {
                      setSelectedRadioTile(val);
                    },
                    activeColor: Colors.orange,
                  ),
                   BlocBuilder<ProductUploadCubit, ProductUploadState>(
                      cubit: uploadCubit,
                      builder: (context, state) {
                        if (state is LoadingStateProduct) {
                          return SizedBox(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return SizedBox();
                      }),
                  CommonButton(
                    buttonColor: AppColors.primaryColor,
                    titleColor: Colors.white,
                    title: LanguageKeys.save.translate(context),
                    onTap: () async {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                    
                        uploadProducts();
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildCategories(List<dynamic> result) {
    _categoriesValue = ValueNotifier<String>(result[0].title);

    return ValueListenableBuilder<String>(
        valueListenable: _categoriesValue,
        builder: (context, value, child) {
          return result != null
              ? DropdownButtonFormField<dynamic>(
                  onSaved: (val) {
                    categoriesName = val;
                  },
                  value: _categoriesValue.value,
                  items: result.map((e) {
                    return DropdownMenuItem<dynamic>(
                        value: e.title,
                        child: Text(
                          e.title,
                          style: TextStyle(fontSize: 14),
                        ));
                  }).toList(),
                  onChanged: result[0].title == ''
                      ? null
                      : (val) {
                          _categoriesValue.value = val;

                          context
                              .bloc<ProductUploadCubit>()
                              .getSubCategories(val);
                        },
                  validator: (val) {
                    if (val.isEmpty) {
                      return "This is Required";
                    }
                  },
                  decoration: inputDecoration(hint: ""),
                )
              : SizedBox();
        });
  }

  String isSelected;
  _buildSubCategories(List<dynamic> subCategories) {
    _subcategoriesValue = ValueNotifier<String>(subCategories[0].title);

    return ValueListenableBuilder<String>(
        valueListenable: _subcategoriesValue,
        builder: (context, value, child) {
          return subCategories != null
              ? DropdownButtonFormField<dynamic>(
                  onSaved: (val) {
                    subCategoriesName = val;
                  },
                  value: _subcategoriesValue.value,
                  items: subCategories.map((e) {
                    return DropdownMenuItem<dynamic>(
                        value: e.title,
                        child: Text(
                          e.title,
                          style: TextStyle(fontSize: 14),
                        ));
                  }).toList(),
                  onChanged: subCategories[0].title == ''
                      ? null
                      : (val) {
                          _subcategoriesValue.value = val;
                          subCategoriesName = val;
                          //context.bloc<ProductUploadCubit>().getBrands(val);
                        },
                  validator: (val) {
                    if (val.isEmpty) {
                      return "This is Required";
                    }
                  },
                  decoration: inputDecoration(hint: ""),
                )
              : SizedBox();
        });
  }

  _buildBrands(List<dynamic> brands) {
    _brands = ValueNotifier<String>(brands[0].title);

    return ValueListenableBuilder<String>(
        valueListenable: _brands,
        builder: (context, value, child) {
          return brands != null
              ? DropdownButtonFormField<dynamic>(
                  // disabledHint: ,
                  onSaved: (val) {
                    brandsName = val;
                  },
                  value: _brands.value,
                  items: brands.map((e) {
                    return DropdownMenuItem<dynamic>(
                        value: e.title,
                        child: Text(
                          e.title,
                          style: TextStyle(fontSize: 14),
                        ));
                  }).toList(),
                  onChanged: (val) {
                    _brands.value = val;

                    // context.bloc<ProductUploadCubit>().getBrands(val);
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return "This is Required";
                    }
                    return null;
                  },
                  decoration: inputDecoration(hint: ""),
                )
              : SizedBox();
        });
  }

  uploadProducts() async {
    try {
      Dio dio = Dio();
      //String docfileName = image.path.split('/').last;

      Options options = Options(
        headers: {
          "Authorization": await getSellerToken(),
        },
        contentType: 'application/json',
      );
      FormData data = FormData.fromMap({
        "image": await MultipartFile.fromFile(controllerImage1.text,
            filename: image1.path.split('/').last), //image1.text,
        "image2": await MultipartFile.fromFile(controllerImage2.text,
            filename: image2.path.split('/').last),
        "image3": await MultipartFile.fromFile(controllerImage3.text,
            filename: image3.path.split('/').last),
        "image4": await MultipartFile.fromFile(controllerImage4.text,
            filename: image4.path.split('/').last),
        "image5": await MultipartFile.fromFile(controllerImage5.text,
            filename: image5.path.split('/').last),
      });
      print(data);

      final response = await dio.post(EndPoint.productImageUpload,
          data: data, options: options);

      if (response.statusCode == 201) {
        var responseJson = response.data;

        var data = ImageResponce.fromJson(responseJson);
        _uploadProductsDetails(data);

        return response;
      } else {
        showMessagess('Try Again');
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        showMessagess('Not Found');
      }
      if (e.response.statusCode == 400) {
        showMessagess('Brand Already Exist');
      } else {
        showMessagess('Try Again');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  _uploadProductsDetails(ImageResponce imageLinks) {
    var data = {
      "Title": productName,
      "Category": categoriesName,
      "SubCategory": subCategoriesName,
      "Brand": brandsName,
      "Discount": disCount,
      "GST": gst,
      "minBuy" : minOrder,
      "Image1": imageLinks.image,
      "Image2": imageLinks.image2,
      "Image3": imageLinks.image3,
      "Image4": imageLinks.image4,
      "Image5": imageLinks.image5,
      "Prize": prize,
      "Description": discription,
      "Specs": selectedSpecs
          .map((e) => {"Title": "Color", "Description": e.toString()})
          .toList(),
      "features": [
        {"Title": "Feature1", "Description": feature1},
        {"Title": "Feature2", "Description": feature2}
      ],
      "Highlights": [
        {"Title": "Highlights1", "Description": highlights1},
        {"Title": "Highlights2", "Description": highlights2}
      ]
    };
    print(data);
    if (_selectedRadioTile == '0') {
      uploadCubit.uploadProduct(data);
    } else if (_selectedRadioTile == '1') {
      uploadCubit.uploadProductAsMember(data);
    } else {
      showMessagess("Please Select");
    }
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged; // +added
  MultiSelectChip(this.reportList, {this.onSelectionChanged} // +added
      );
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = List();
  _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices); // +added
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
