import 'dart:convert';
import 'dart:io';
import 'package:digitalkarobaar/src/core/endpoint/end_points.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/models/ads_seller.dart';
import 'package:digitalkarobaar/src/models/categories.dart';
import 'package:digitalkarobaar/src/models/get_userOrder.dart';
import 'package:digitalkarobaar/src/models/home_adverties.dart';
import 'package:digitalkarobaar/src/models/home_image.dart';
import 'package:digitalkarobaar/src/models/kyc_add_page.dart';
import 'package:digitalkarobaar/src/models/notification_in_app.dart';
import 'package:digitalkarobaar/src/models/product_spec.dart';
import 'package:digitalkarobaar/src/models/products.dart';
import 'package:digitalkarobaar/src/models/top_products.dart';
import 'package:digitalkarobaar/src/models/user_profile.dart';
import 'package:digitalkarobaar/src/models/user_story.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

typedef void OnUploadProgressCallback(int sentBytes, int totalBytes);

class HomeReposiitory {
  static Future<List<Categories>> getCategories() async {
    try {
      final response = await http.get(
        EndPoint.categories,
        headers: {
          "Authorization": await getAccessToken(),
          'Content-type': 'application.json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body) as List;

        return List.generate(res.length, (index) {
          return Categories.fromJson(res[index]);
        }).toList();
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<TopProducts> getBrands() async {
    try {
      final response = await http.get(
        EndPoint.brand,
        headers: {
          "Authorization": await getAccessToken(),
          'Content-type': 'application.json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);
        return TopProducts.fromJson(res[0]);
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<TopProducts> getTopBrands() async {
    try {
      final response = await http.get(
        EndPoint.topbrand,
        headers: {
          "Authorization": await getAccessToken(),
          'Content-type': 'application.json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);
        return TopProducts.fromJson(res[0]);
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<UserProfile> getProfileInfo() async {
    try {
      // var resjson;
      final response = await http.get(
        EndPoint.userProfile,
        headers: {
          'Authorization': await getAccessToken(),
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);
        return UserProfile.fromJson(res[0]);
      } else {
        print(response.statusCode.toString());
      }
      if (response.statusCode == 404) {
        Fluttertoast.showToast(
            backgroundColor: AppColors.primaryColor, msg: 'Not Found');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> updateProfile(
      String name, String business, String pincode, String email) async {
    Map _map = {
      'Name': name,
      'PinCode': pincode,
      'Business': business,
      'Email': email
    };
    String token = await getAccessToken();
    try {
      final response = await http.post(
        EndPoint.updateProfile,
        body: json.encode(_map),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);

        return res["success"];
      } else {
        print(response.statusCode.toString());
        throw Exception("Update Failed");
      }
    } catch (e) {
      throw Exception("Update Failed");
    }
  }

  static uploadKyc(
      {File file, OnUploadProgressCallback onUploadProgressCallback}) async {
    try {
      Dio dio = Dio();
      String fileName = file.path.split('/').last;
      Options options = Options(
        headers: {
          "Authorization": await getAccessToken(),
        },
        contentType: 'application/json',
      );
      FormData formData = FormData.fromMap({
        "document": await MultipartFile.fromFile(file.path, filename: fileName)
      });

      final response = await dio.post(EndPoint.updateKyc,
          data: formData,
          options: options, onSendProgress: (int sent, int total) {
        onUploadProgressCallback(sent, total);
      });

      if (response.statusCode == 200) {
        showMessagess('file uploaded successfully');
      
      } else {
        showMessagess('file not uploaded');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<String> getKyc() async {
    try {
      final response = await http.get(
        EndPoint.getKyc,
        headers: {
          "Authorization": await getAccessToken(),
          'Content-type': 'application.json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);
        // print(res["verified"]);
        return res["verified"];
      } else {
        print(response.statusCode.toString());
        return response.statusCode.toString();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Products>> getProducts() async {
    try {
      final response = await http.get(
        EndPoint.productget,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body) as List;
        return List.generate(res.length, (index) {
          return Products.fromJson(res[index]);
        });
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Products>> searchProduts(String productsName) async {
    try {
      final response = await http.get(
        EndPoint.searchProducts + '$productsName',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body) as List;

        return res.map((e) => Products.fromJson(e)).toList();
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Products> getProductsDetails(int id) async {
    try {
      final response = await http.get(
        EndPoint.productsDetails + '$id',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);

        return Products.fromJson(res[0]);
      } else if (response.statusCode == 404 || response.statusCode == 500) {
        showMessagess('Not Found');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Specification> getProductsSpecification(int id) async {
    try {
      final response = await http.get(
        EndPoint.productspecs + '$id',
      );
      if (response.statusCode == 200) {
        final res = json.decode(response.body);

        return Specification.fromJson(res);
      } else if (response.statusCode == 404 || response.statusCode == 500) {
        showMessagess('Not Found');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Products> getfilter() async {
    try {
      final response = await http.get(
        EndPoint.productsFilter,
        headers: {
          "Authorization": await getAccessToken(),
          'Content-type': 'application.json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);
        print(response.body.toString());
        //return Products.fromJson(res[0]);
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // static Future<dynamic> profilePic(File profilPic) async {
  //   try {
  //     Dio dio = Dio();
  //     String docfileName = profilPic.path.split('/').last;
  //     Options options = Options(
  //       headers: {
  //         "Authorization": await getAccessToken(),
  //       },
  //       contentType: 'application/json',
  //     );
  //     FormData formData = FormData.fromMap({
  //       "ProfilePic":
  //           await MultipartFile.fromFile(profilPic.path, filename: docfileName),
  //     });

  //     final response = await dio.post(EndPoint.updateProfile,
  //         data: formData,
  //         options: options, onSendProgress: (int sent, int total) {
  //       // onUploadProgressCallback(sent, total);
  //     });

  //     if (response.statusCode == 200) {
  //       var responseJson = json.decode(response.data);
  //       showMessagess("Profile Updated");
  //     } else {
  //       Fluttertoast.showToast(
  //           backgroundColor: AppColors.primaryColor, msg: "Try Agin");
  //     }
  //   } on DioError catch (e) {
  //     if (e.response.statusCode == 404) {
  //       Fluttertoast.showToast(
  //           backgroundColor: AppColors.primaryColor, msg: "Not Found");
  //     }
  //     Fluttertoast.showToast(
  //         backgroundColor: AppColors.primaryColor, msg: "Try Agin");
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }


  static Future<dynamic> profilePic(File profilPic) async {
    try {
      Dio dio = Dio();
      String docfileName = profilPic.path.split('/').last;
      Options options = Options(
        headers: {
          "Authorization": await getAccessToken(),
        },
        contentType: 'application/json',
      );
      FormData formData = FormData.fromMap({
        "ProfilePic":
            await MultipartFile.fromFile(profilPic.path, filename: docfileName),
      });

      final response = await dio.post(EndPoint.profilePic,
          data: formData,
          options: options,
         //  onSendProgress: (int sent, int total) {
        // onUploadProgressCallback(sent, total);
      //}
      );

      if (response.statusCode == 200) {
        var responseJson = response.data;
        showMessagess("Profile Pic Updated");
        return responseJson;
      } else {
        Fluttertoast.showToast(
            backgroundColor: AppColors.primaryColor, msg: "Try Agin");
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        Fluttertoast.showToast(
            backgroundColor: AppColors.primaryColor, msg: "Not Found");
      }
      Fluttertoast.showToast(
          backgroundColor: AppColors.primaryColor, msg: "Try Agin");
    } catch (e) {
      throw Exception(e);
    }
  }





  static Future<List<UserOrderGet>> getUserOrder() async {
    try {
      final response = await http.get(
        EndPoint.userAllOrder,
        headers: {
          "Authorization": await getAccessToken(),
          //  "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjg4NDU3MzUwLCJqdGkiOiJjYzNkZjA5NTRkMjA0N2U5OGUyOTgxOTNiZGFiM2QzNSIsInVzZXJfaWQiOjN9.CFlsZNFEk0lwC0VP5Gnz2JyC35TVP2TcyN0TYJMd5XE",
          //,
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final res = json.decode(response.body) as List;
        return List.generate(res.length, (index) {
          return UserOrderGet.fromJson(res[index]);
        }).toList();
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<UserOrderGet>> getUserPlacedOrder() async {
    try {
      final response = await http.get(
        EndPoint.userPlacedOrder,
        headers: {
          "Authorization": await getAccessToken(),
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body) as List;
        return List.generate(res.length, (index) {
          return UserOrderGet.fromJson(res[index]);
        }).toList();
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<UserOrderGet>> getUserPendingOrder() async {
    try {
      final response = await http.get(
        EndPoint.userPendingOrder,
        headers: {
          "Authorization": await getAccessToken(),
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body) as List;
        return List.generate(res.length, (index) {
          return UserOrderGet.fromJson(res[index]);
        }).toList();
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<UserOrderGet>> getUserDeliveredOrder() async {
    try {
      final response = await http.get(
        EndPoint.userDeliveredOrder,
        headers: {
          "Authorization": await getAccessToken(),
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body) as List;
        return List.generate(res.length, (index) {
          return UserOrderGet.fromJson(res[index]);
        }).toList();
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<UserOrderGet>> getUserShipedOrder() async {
    try {
      final response = await http.get(
        EndPoint.userShipedOrder,
        headers: {
          "Authorization": await getAccessToken(),
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body) as List;
        return List.generate(res.length, (index) {
          return UserOrderGet.fromJson(res[index]);
        }).toList();
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<DataAds>> getAdsSeller() async {
    try {
      final response = await http.get(
        EndPoint.getSellerAds,
        headers: {
          // "Authorization": await getSellerToken(),
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final res = json.decode(response.body);
        List<dynamic> data = res["data"];
        return List.generate(data.length, (index) {
          return DataAds.fromJson(data[index]);
        }).toList();
      } else {
        //_handleResponse(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<UserStory> getUserSoty() async {
    try {
      final response = await http.get(
        EndPoint.getUserStory,
        headers: {
          "Authorization": await getAccessToken(),
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final res = json.decode(response.body);

        return UserStory.fromJson(res);
      } else {
        //_handleResponse(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Products>> getSellerSotyProducts(String id) async {
    try {
      final response = await http.get(
        EndPoint.getSellerStoryProducts + id,
        headers: {
          // "Authorization": await getSellerToken(),
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final res = json.decode(response.body) as List;
        return List.generate(res.length, (index) {
          return Products.fromJson(res[index]);
        }).toList();
      } else {
        //_handleResponse(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<HomeImages>> getImages() async {
    try {
      final response = await http.get(EndPoint.addImages);
      if (response.statusCode == 200) {
        final res = json.decode(response.body) as List;
        return List.generate(res.length, (index) {
          return HomeImages.fromJson(res[index]);
        }).toList();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<HomeAdvertisment> getAdvertisment() async {
    try {
      final response = await http.get(
        EndPoint.getSellerHomeAds,
        headers: {'Accept': 'application/json'},
      );
      if (response.statusCode == 200) {
        final res = json.decode(response.body);
        return HomeAdvertisment.fromJson(res);
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<ProductNoti>> getProductNotification() async {
    try {
      final response = await http.get(EndPoint.getNotification, headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);
        List<dynamic> data = res['product'];
        return List.generate(data.length, (index) {
          return ProductNoti.fromJson(data[index]);
        }).toList();
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<SellerNoti>> getSellerNotification() async {
    try {
      final response = await http.get(EndPoint.getNotification, headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);
        List<dynamic> data = res['seller'];
        return List.generate(data.length, (index) {
          return SellerNoti.fromJson(data[index]);
        }).toList();
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<KycPageAdd> getKycAdvertisment() async {
    try {
      final response = await http.get(
        EndPoint.kycAdvertisment,
        headers: {'Accept': 'application/json'},
      );
      if (response.statusCode == 200) {
        final res = json.decode(response.body);
        return KycPageAdd.fromJson(res);
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
