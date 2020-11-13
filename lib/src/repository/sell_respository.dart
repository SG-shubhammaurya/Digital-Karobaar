// import 'dart:convert';
// import 'dart:io';
// import 'package:digitalkarobaar/src/core/endpoint/end_points.dart';
// import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
// import 'package:digitalkarobaar/src/core/utils/preference_helper.dart';
// import 'package:digitalkarobaar/src/models/Member.dart';
// import 'package:digitalkarobaar/src/models/pincode_state.dart';
// import 'package:digitalkarobaar/src/models/premium_seller.dart';
// import 'package:digitalkarobaar/src/models/search_pincode_by.dart';
// import 'package:digitalkarobaar/src/models/seller_dash.dart';
// import 'package:digitalkarobaar/src/models/seller_profile.dart';
// import 'package:digitalkarobaar/src/models/states.dart';
// import 'package:digitalkarobaar/src/res/app_colors.dart';
// import 'package:dio/dio.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;

// class SellRepository {
//   Future<dynamic> onSellRegistration(String no, String password) async {
//     Map _map = {
//       'PhoneNo': no,
//       'Password': password,
//     };
//     try {
//       final response = await http
//           .post(EndPoint.sellSignup, body: json.encode(_map), headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       });
//       if (response.statusCode == 200) {
//         final jsonString = json.decode(response.body);
//         showMessagess('Success');

//         print(jsonString["otp"]);

//         await PreferenceHelper.setSellAccessToken(
//             jsonString["token"]["access"]);
//         return response;
//       } else {
//         showMessagess('Try Again');
//       }
//       if (response.statusCode == 500) {
//         showMessagess('Already Exist');
//       }
//     } catch (e) {
//       throw Exception("Cancel Registration");
//     }
//   }

//   Future<http.Response> sellLogin(String no, String password) async {
//     Map _map = {
//       'PhoneNo': no,
//       'Password': password,
//     };
//     try {
//       final response = await http
//           .post(EndPoint.sellLogin, body: json.encode(_map), headers: {
//         'content-type': 'application/json',
//         'Accept': 'application/json',
//       });
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         showMessagess('login');

//         final jsonString = json.decode(response.body);
//         //  print(jsonString["access"]["access"]);
//         await PreferenceHelper.setSellAccessToken(
//             jsonString["access"]["access"]);
//         await PreferenceHelper.setSellerTokenDash(
//             jsonString["access"]["access"]);

//         return response;
//       } else if (response.statusCode == 400) {
//         showMessagess('Invalid User Name/Password');
//       }
//     } catch (e) {
//       showMessagess('Invalid');
//     }
//   }

//   static Future sellForgetPassword(String no, String password) async {
//     Map _map = {
//       'PhoneNo': no,
//       'Password': password,
//     };
//     try {
//       final response = await http
//           .post(EndPoint.sellForgetPass, body: json.encode(_map), headers: {
//         'content-type': 'application/json',
//         'Accept': 'application/json',
//       });
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final jsonString = json.decode(response.body);
//         showMessagess(jsonString["success"]);

//         return response ;
//       } else if (response.statusCode == 404) {
//         showMessagess('Seller with this number not exist');
//       }
//     } catch (e) {
//       throw Exception("cancel Login");
//     }
//   }

//   Future<dynamic> otpRegister(String textEditingController) async {
//     final accessSellToken = await getSellerToken();

//     var jsonres;
//     try {
//       var otpMap = {"OTP": textEditingController};
//       final response =
//           await http.post(EndPoint.sellVerify, body: otpMap, headers: {
//         "Authorization": accessSellToken,
//         'Accept': 'application/json',
//       });
//       if (response.statusCode == 200) {
//         jsonres = json.decode(response.body);
//         await PreferenceHelper.setSellAccessToken(jsonres["token"]['access']);

//         showMessagess('success');

//         return response;
//       }

//       if (response.statusCode == 406) {
//         showMessagess('enter otp is incorrect');
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   Future<dynamic> fillForm(Map<dynamic, dynamic> data) async {
//     final accessSellToken = await getSellerToken();

//     var jsonres;
//     try {
//       final response =
//           await http.post(EndPoint.formDetail, body: data, headers: {
//         "Authorization": accessSellToken,
//         'Accept': 'application/json',
//       });
//       if (response.statusCode == 201 || response.statusCode == 200) {
//         jsonres = json.decode(response.body);
//         showMessagess('success');
//         return jsonres['id'];
//       }

//       if (response.statusCode == 406) {
//         showMessagess('please provide all the details');
//         throw Exception();
//       }
//       if (response.statusCode == 500) {
//         showMessagess('Server Error');
//         throw Exception();
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   Future<dynamic> updateFormDetails(Map<dynamic, dynamic> data) async {
//     final accessSellToken = await getSellerToken();

//     var jsonres;
//     try {
//       final response =
//           await http.post(EndPoint.sellerProfileUpdate, body: data, headers: {
//         "Authorization": accessSellToken,
//         'Accept': 'application/json',
//       });
//       if (response.statusCode == 201) {
//         jsonres = json.decode(response.body);
//         showMessagess('success');

//         return jsonres['id'];
//       }

//       if (response.statusCode == 406) {
//         showMessagess('enter otp is incorrect');
//         throw Exception();
//       }
//       if (response.statusCode == 500) {
//         showMessagess('Server Error');
//         throw Exception();
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   Future<List<States>> getAllState() async {
//     try {
//       final res = await http.get(EndPoint.allStates);
//       if (res.statusCode == 200) {
//         final jsonStr = json.decode(res.body) as List;

//         final result = jsonStr.map((e) => States.fromJson(e)).toList();

//         return result;
//       }
//     } catch (e) {}
//   }

//   getCities(String state) async {
//     final res = await http.get(EndPoint.getCities + "$state");
//     if (res.statusCode == 200) {
//       final jsonStr = json.decode(res.body) as List;

//       final result = jsonStr.map((e) => e["Name"]).toList();
//       return result;
//     }
//   }

//   static Future<List<dynamic>> getStateCity(String pincode) async {
//     final res = await http.get(EndPoint.searchPinCodeBy + pincode);
//     if (res.statusCode == 200) {
//       final jsonStr = json.decode(res.body);

//       List<dynamic> result =
//           jsonStr["data"].map((e) => Data.fromJson(e)).toList();
//       return result;
//     } else {
//       throw Exception();
//     }
//   }

//   static Future<List<dynamic>> stateCity(String pincode) async {
//     final res = await http.get(EndPoint.searchSecondPinCodeBy + pincode);
//     if (res.statusCode == 200) {
//       final jsonStr = json.decode(res.body);

//       List<dynamic> result =
//           jsonStr["PostOffice"].map((e) => PostOffice.fromJson(e)).toList();
//       return result;
//     } else {
//       throw Exception();
//     }
//   }

//   static Future<int> uploadDocuments(
//       File doc, File sign, String id, String no) async {
//     try {
//       Dio dio = Dio();
//       String docfileName = doc.path.split('/').last;
//       String signfileName = doc.path.split('/').last;
//       Options options = Options(
//         headers: {
//           "Authorization": await getSellerToken(),
//         },
//         contentType: 'application/json',
//       );
//       FormData formData = FormData.fromMap({
//         "document":
//             await MultipartFile.fromFile(doc.path, filename: docfileName),
//         "sign": await MultipartFile.fromFile(doc.path, filename: signfileName),
//         "SellerDetailId": id,
//         "number": no
//       });

//       final response =
//           await dio.post(EndPoint.uploadDoc, data: formData, options: options);

//       if (response.statusCode == 201) {
//         var responseJson = response.data;
//         showMessagess('Created');
//         return responseJson["SellerDetailId"];
//       } else {
//         showMessagess('Try Again');
//       }
//     } on DioError catch (e) {
//       if (e.response.statusCode == 404) {
//         showMessagess('Not Found');
//       } else {
//         showMessagess('Try Again');
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   static Future<dynamic> pickupDetails(Map<dynamic, dynamic> data) async {
//     final accessSellToken = await getSellerToken();

//     var jsonres;
//     try {
//       final response =
//           await http.post(EndPoint.pickupDetails, body: data, headers: {
//         "Authorization": accessSellToken,
//         'Accept': 'application/json',
//       });
//       if (response.statusCode == 201) {
//         jsonres = json.decode(response.body);
//         showMessagess('Created');
//         return jsonres['SellerDetailId'];
//       }

//       if (response.statusCode == 406) {
//         showMessagess('enter otp is incorrect');
//         throw Exception();
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   static Future<int> uploadBankDetails(File doc, String ifscCode, String accNo,
//       String holderName, String bankName, String id) async {
//     try {
//       Dio dio = Dio();
//       String docfileName = doc.path.split('/').last;

//       Options options = Options(
//         headers: {
//           "Authorization": await getSellerToken(),
//         },
//         contentType: 'application/json',
//       );
//       FormData formData = FormData.fromMap({
//         "Cheque": await MultipartFile.fromFile(doc.path, filename: docfileName),
//         "Bank_Name": bankName,
//         "IFSC": ifscCode,
//         "ACCNO": accNo,
//         "Ben_Name": accNo,
//         "SellerDetailId": id
//       });

//       final response =
//           await dio.post(EndPoint.formbank, data: formData, options: options);

//       if (response.statusCode == 201) {
//         var responseJson = response.data;
//         showMessagess('Created');

//         return responseJson["SellerDetailId"];
//       } else {
       
//          throw Exception();
//       }
//     } on DioError catch (e) {
//       if (e.response.statusCode == 404) {
//         showMessagess('Not Found');
//       } else {
//         showMessagess('Try Again');
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   static Future uploadMov(
//       File image, String brandName, String categories) async {
//     try {
//       Dio dio = Dio();
//       String docfileName = image.path.split('/').last;

//       Options options = Options(
//         headers: {
//           "Authorization": await getSellerToken(),
//         },
//         contentType: 'application/json',
//       );
//       FormData formData = FormData.fromMap({
//         "Image":
//             await MultipartFile.fromFile(image.path, filename: docfileName),
//         "Category": categories,
//         "Title": brandName,
//       });

//       final response = await dio.post(EndPoint.brandRegister,
//           data: formData, options: options);

//       if (response.statusCode == 200) {
//         var responseJson = response.data;
//         showMessagess(responseJson["success"]);
//         return response;
//       } else {
//         showMessagess('Try Again');
//       }
//     } on DioError catch (e) {
//       if (e.response.statusCode == 404) {
//         showMessagess('Not Found');
//       }
//       if (e.response.statusCode == 400) {
//         showMessagess('Brand Already Exist');
//       } else {
//         showMessagess('Try Again');
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   Future<dynamic> verifyForgetPswd(String textEditingController) async {
//     // final accessSellForgetToken = await PreferenceHelper.getSellForgetAccessToken();
//     var jsonres;
//     try {
//       var otpMap = {"OTP": textEditingController};
//       final response = await http
//           .post(EndPoint.sellForgetPassVerify, body: otpMap, headers: {
//         // "Authorization": accessSellForgetToken,
//         "Accept": 'application/json',
//       });
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         jsonres = json.decode(response.body);
//         Fluttertoast.showToast(
//             backgroundColor: AppColors.primaryColor, msg: "success");
//         return response;
//       }
//       if (response.statusCode == 406) {
//         if (response.statusCode == 406) {
//           showMessagess('enter otp is incorrect');
//         }
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   static Future<PremiumSeller> follow(int id) async {
//     try {
//       var idMap = {"Seller": id.toString()};
//       final response = await http.post(
//         EndPoint.followUser,
//         headers: {
//           "Authorization": await getAccessToken(),
//           'Accept': 'application/json',
//         },
//         body: idMap,
//       );
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         //    final jsonres = json.decode(response.body);
//         Fluttertoast.showToast(
//             backgroundColor: AppColors.primaryColor, msg: "success");
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   static Future<PremiumSeller> getPremiunSeller() async {
//     try {
//       final response = await http
//           .get(EndPoint.premiumSeller, headers: {'Accept': 'Application/json'});
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final res = json.decode(response.body);
//         return PremiumSeller.fromJson(res);
//       } else {
//         print(response.statusCode.toString());
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   static Future<void> getSellerFollower() async {
//     final token = await getSellerToken();

//     try {
//       final response = await http.get(EndPoint.followerSellerGet,
//           headers: {"Authorization": token, 'Accept': 'Application/json'});
//       if (response.statusCode == 200) {}
//       if (response.statusCode == 500) {
//         showMessagess('Server Error');
//       }
//       if (response.statusCode == 404) {
//         showMessagess('Not Found');
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   static Future<void> getFolloweing() async {
//     final token = await getSellerToken();

//     try {
//       final response = await http.get(EndPoint.followingGetUser,
//           headers: {"Authorization": token, 'Accept': 'Application/json'});
//       if (response.statusCode == 200) {}
//       if (response.statusCode == 500) {
//         showMessagess('Server Error');
//       }
//       if (response.statusCode == 404) {
//         showMessagess('Not Found');
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   static Future<SellerDash> getSellerShop(int id) async {
//     final token = await getAccessToken();

//     try {
//       final response = await http.get(EndPoint.sellerShopDash + "$id",
//           headers: {"Authorization": token, 'Accept': 'Application/json'});
//       if (response.statusCode == 200) {
//         final res = json.decode(response.body);
//         return SellerDash.fromJson(res);
//       }
//       if (response.statusCode == 500) {
//         showMessagess('Internal Server Error');
//       }
//       if (response.statusCode == 404) {
//         showMessagess('Not Found');
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   static Future<List<Member>> getMember() async {
//     try {
//       final response = await http.get(
//         EndPoint.getTeamMemer,
//         headers: {
//           "Authorization": await PreferenceHelper.getSellAccessToken(),
//           'content-type': 'application/json',
//           'Accept': 'application/json',
//         },
//       );

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final res = json.decode(response.body) as List;
//         return List.generate(res.length, (index) {
//           return Member.fromJson(res[index]);
//         }).toList();
//       } else {
//         print(response.statusCode.toString());
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   Future<dynamic> onMemberRegister(
//       String memberNo, String password, String sellerNo) async {
//     Map _map = {
//       'PhoneNo': memberNo,
//       'Password': password,
//       'Seller': sellerNo,
//     };
//     try {
//       final response = await http
//           .post(EndPoint.memberSignUp, body: json.encode(_map), headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       });
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final jsonString = json.decode(response.body);
//         showMessagess("Success");
//         print(jsonString["otp"]);
//         await PreferenceHelper.setMemberAccessToken(
//             jsonString["token"]["access"]);
//         return response;
//       } else {
//         showMessagess("Try Again");
//       }
//       if (response.statusCode == 404) {
//         showMessagess("Seller with this not Register");
//       }
//       if (response.statusCode == 500) {
//         showMessagess("Already Exist");
//       }
//     } catch (e) {
//       throw Exception("cancell SignUp");
//     }
//   }

//   Future<dynamic> otpMemberRegister(String textEditingController) async {
//     final accessMemberToken = await getMemberToken();
//     var jsonres;
//     try {
//       var otpMap = {"OTP": textEditingController};
//       final response =
//           await http.post(EndPoint.memberOtpVerify, body: otpMap, headers: {
//         "Authorization": accessMemberToken,
//         'Accept': 'application/json',
//       });
//       if (response.statusCode == 200) {
//         jsonres = json.decode(response.body);
//         await PreferenceHelper.setMemberAccessToken(jsonres["token"]['access']);
//         showMessagess('Success');
//         return jsonres['success'];
//       }
//       if (response.statusCode == 406) {
//         showMessagess('Incorrect OTP');
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   Future<http.Response> memberLogin(String no, String password) async {
//     Map _map = {
//       'PhoneNo': no,
//       'Password': password,
//     };
//     try {
//       final response = await http
//           .post(EndPoint.memberLogin, body: json.encode(_map), headers: {
//         'content-type': 'application/json',
//         'Accept': 'application/json',
//       });
//       if (response.statusCode == 200) {
//         showMessagess('login');
//         final jsonString = json.decode(response.body);
//         print(jsonString["token"]["access"]);
//         await PreferenceHelper.setMemberAccessToken(
//             jsonString["token"]["access"]);
//         return response;
//       } else if (response.statusCode == 406) {
//         showMessagess('Invalid Member or Password');
//       }
//     } catch (e) {
//       showMessagess('Invalid');
//     }
//   }

//   static Future memberForgetPassword(String no, String password) async {
//     Map _map = {
//       'PhoneNo': no,
//       'Password': password,
//     };
//     try {
//       final response = await http.post(EndPoint.forgetMemberPassword,
//           body: json.encode(_map),
//           headers: {
//             'content-type': 'application/json',
//             'Accept': 'application/json',
//           });
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final jsonString = json.decode(response.body);
//         showMessagess('otp sent');
//         print(jsonString["otp"]);
//         print(jsonString["token"]["access"]);
//         await PreferenceHelper.setMemberAccessToken(
//             jsonString["token"]["access"]);
//         // showMessagess(jsonString["Sucess"]);
//       } else if (response.statusCode == 404) {
//         showMessagess('Seller with this number not exist');
//       }
//     } catch (e) {
//       throw Exception("Failed To changed password");
//     }
//   }

//   Future<dynamic> verifyMemberForgetPassword(
//       String textEditingController) async {
//     final accessMemberToken = await getMemberToken();
//     var jsonres;
//     try {
//       var otpMap = {"OTP": textEditingController};
//       final response = await http
//           .post(EndPoint.frogetMemberPasswordVerify, body: otpMap, headers: {
//         "Authorization": accessMemberToken,
//         'Accept': 'Application/json',
//       });
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         jsonres = json.decode(response.body);
//         Fluttertoast.showToast(
//             backgroundColor: AppColors.primaryColor, msg: "sucess");
//         return jsonres['sucess'];
//       }
//       if (response.statusCode == 406) {
//         Fluttertoast.showToast(msg: 'enter otp is incorrect');
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   static Future<dynamic> removeMember(int id) async {
//     final accessSellerToken = await getSellerToken();
//     try {
//       var idMap = {'id': id.toString()};
//       final response = await http.post(
//         EndPoint.removeMember,
//         headers: {
//           "Authorization": accessSellerToken,
//           'Accept': 'application/json',
//         },
//         body: idMap,
//       );
//       if (response.statusCode == 200) {
//         showMessagess('Member Remove');
//       }
//       if (response.statusCode == 403) {
//         showMessagess('You do not have permission to perform this action');
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   static Future<SellerProfile> getSellerProfileInfo() async {
//     try {
//       final response = await http.get(
//         EndPoint.sellerProfileGet,
//         headers: {
//           "Authorization": await getSellerToken(),
//           'Accept': 'application/json',
//         },
//       );
//       if (response.statusCode == 200) {
//         final res = json.decode(response.body);
//         return SellerProfile.fromJson(res);
//       } else {
//         print(response.statusCode.toString());
//       }
//       if (response.statusCode == 404) {
//         showMessagess('Not Found');
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }




import 'dart:convert';
import 'dart:io';
import 'package:digitalkarobaar/src/core/endpoint/end_points.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/core/utils/preference_helper.dart';
import 'package:digitalkarobaar/src/models/Member.dart';
import 'package:digitalkarobaar/src/models/pincode_state.dart';
import 'package:digitalkarobaar/src/models/premium_seller.dart';
import 'package:digitalkarobaar/src/models/search_pincode_by.dart';
import 'package:digitalkarobaar/src/models/seller_dash.dart';
import 'package:digitalkarobaar/src/models/seller_profile.dart';
import 'package:digitalkarobaar/src/models/states.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class SellRepository {
  Future<dynamic> onSellRegistration(String no, String password) async {
    Map _map = {
      'PhoneNo': no,
      'Password': password,
    };
    try {
      final response = await http
          .post(EndPoint.sellSignup, body: json.encode(_map), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        final jsonString = json.decode(response.body);
        showMessagess('Success');

        print(jsonString["otp"]);

        await PreferenceHelper.setSellAccessToken(
            jsonString["token"]["access"]);
        return response;
      } else {
        showMessagess('Try Again');
      }
      if (response.statusCode == 500) {
        showMessagess('Already Exist');
      }
    } catch (e) {
      throw Exception("Cancel Registration");
    }
  }

  Future<http.Response> sellLogin(String no, String password) async {
    Map _map = {
      'PhoneNo': no,
      'Password': password,
    };
    try {
      final response = await http
          .post(EndPoint.sellLogin, body: json.encode(_map), headers: {
        'content-type': 'application/json',
        'Accept': 'application/json',
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        showMessagess('login');

        final jsonString = json.decode(response.body);
        //  print(jsonString["access"]["access"]);
        await PreferenceHelper.setSellAccessToken(
            jsonString["access"]["access"]);
        await PreferenceHelper.setSellerTokenDash(
            jsonString["access"]["access"]);

        return response;
      } else if (response.statusCode == 400) {
        showMessagess('Invalid User Name/Password');
      }
    } catch (e) {
      showMessagess('Invalid');
    }
  }

  static Future sellForgetPassword(String no, String password) async {
    Map _map = {
      'PhoneNo': no,
      'Password': password,
    };
    try {
      final response = await http
          .post(EndPoint.sellForgetPass, body: json.encode(_map), headers: {
        'content-type': 'application/json',
        'Accept': 'application/json',
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonString = json.decode(response.body);
        showMessagess(jsonString["success"]);

        return response ;
      } else if (response.statusCode == 404) {
        showMessagess('Seller with this number not exist');
      }
    } catch (e) {
      throw Exception("cancel Login");
    }
  }

  Future<dynamic> otpRegister(String textEditingController) async {
    final accessSellToken = await getSellerToken();

    var jsonres;
    try {
      var otpMap = {"OTP": textEditingController};
      final response =
          await http.post(EndPoint.sellVerify, body: otpMap, headers: {
        "Authorization": accessSellToken,
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        jsonres = json.decode(response.body);
        await PreferenceHelper.setSellAccessToken(jsonres["token"]['access']);

        showMessagess('success');

        return response;
      }

      if (response.statusCode == 406) {
        showMessagess('enter otp is incorrect');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> fillForm(Map<dynamic, dynamic> data) async {
    final accessSellToken = await getSellerToken();

    var jsonres;
    try {
      final response =
          await http.post(EndPoint.formDetail, body: data, headers: {
        "Authorization": accessSellToken,
        'Accept': 'application/json',
      });
      if (response.statusCode == 201 || response.statusCode == 200) {
        jsonres = json.decode(response.body);
        showMessagess('success');
        return jsonres['id'];
      }

      if (response.statusCode == 406) {
        showMessagess('please provide all the details');
        throw Exception();
      }
      if (response.statusCode == 500) {
        showMessagess('Server Error');
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> updateFormDetails(Map<dynamic, dynamic> data) async {
    final accessSellToken = await getSellerToken();

    var jsonres;
    try {
      final response =
          await http.post(EndPoint.sellerProfileUpdate, body: data, headers: {
        "Authorization": accessSellToken,
        'Accept': 'application/json',
      });
      if (response.statusCode == 201) {
        jsonres = json.decode(response.body);
        showMessagess('success');

        return jsonres['id'];
      }

      if (response.statusCode == 406) {
        showMessagess('enter otp is incorrect');
        throw Exception();
      }
      if (response.statusCode == 500) {
        showMessagess('Server Error');
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<States>> getAllState() async {
    try {
      final res = await http.get(EndPoint.allStates);
      if (res.statusCode == 200) {
        final jsonStr = json.decode(res.body) as List;

        final result = jsonStr.map((e) => States.fromJson(e)).toList();

        return result;
      }
    } catch (e) {}
  }

  getCities(String state) async {
    final res = await http.get(EndPoint.getCities + "$state");
    if (res.statusCode == 200) {
      final jsonStr = json.decode(res.body) as List;

      final result = jsonStr.map((e) => e["Name"]).toList();
      return result;
    }
  }

  static Future<List<dynamic>> getStateCity(String pincode) async {
    final res = await http.get(EndPoint.searchPinCodeBy + pincode);
    if (res.statusCode == 200) {
      final jsonStr = json.decode(res.body);

      List<dynamic> result =
          jsonStr["data"].map((e) => Data.fromJson(e)).toList();
      return result;
    } else {
      throw Exception();
    }
  }

  static Future<List<dynamic>> stateCity(String pincode) async {
    final res = await http.get(EndPoint.searchSecondPinCodeBy + pincode);
    if (res.statusCode == 200) {
      final jsonStr = json.decode(res.body);

      List<dynamic> result =
          jsonStr["PostOffice"].map((e) => PostOffice.fromJson(e)).toList();
      return result;
    } else {
      throw Exception();
    }
  }

  static Future<int> uploadDocuments(
      File doc, File sign, String id, String no) async {
    try {
      Dio dio = Dio();
      String docfileName = doc.path.split('/').last;
      String signfileName = doc.path.split('/').last;
      Options options = Options(
        headers: {
          "Authorization": await getSellerToken(),
        },
        contentType: 'application/json',
      );
      FormData formData = FormData.fromMap({
        "document":
            await MultipartFile.fromFile(doc.path, filename: docfileName),
        "sign": await MultipartFile.fromFile(doc.path, filename: signfileName),
        "SellerDetailId": id,
        "number": no
      });

      final response =
          await dio.post(EndPoint.uploadDoc, data: formData, options: options);

      if (response.statusCode == 201) {
        var responseJson = response.data;
        showMessagess('Created');
        return responseJson["SellerDetailId"];
      } else {
        showMessagess('Try Again');
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        showMessagess('Not Found');
      } else {
        showMessagess('Try Again');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> pickupDetails(Map<dynamic, dynamic> data) async {
    final accessSellToken = await getSellerToken();

    var jsonres;
    try {
      final response =
          await http.post(EndPoint.pickupDetails, body: data, headers: {
        "Authorization": accessSellToken,
        'Accept': 'application/json',
      });
      if (response.statusCode == 201) {
        jsonres = json.decode(response.body);
        showMessagess('Created');
        return jsonres['SellerDetailId'];
      }

      if (response.statusCode == 406) {
        showMessagess('enter otp is incorrect');
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<int> uploadBankDetails(File doc, String ifscCode, String accNo,
      String holderName, String bankName, String id) async {
    try {
      Dio dio = Dio();
      String docfileName = doc.path.split('/').last;

      Options options = Options(
        headers: {
          "Authorization":await getSellerToken(),
        },
        contentType: 'application/json',
      );
      FormData formData = FormData.fromMap({
        "Cheque": await MultipartFile.fromFile(doc.path, filename: docfileName),
        "Bank_Name": bankName,
        "IFSC": ifscCode,
        "ACCNO": accNo,
        "Ben_Name": accNo,
        "SellerDetailId": id
      });

      final response =
          await dio.post(EndPoint.formbank, data: formData, options: options);

      if (response.statusCode == 201) {
        var responseJson = response.data;
        showMessagess('Created');

        return responseJson["SellerDetailId"];
      } else {
       
         throw Exception();
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        showMessagess('Not Found');
      } else {
        showMessagess('Try Again');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future uploadMov(
      File image, String brandName, String categories) async {
    try {
      Dio dio = Dio();
      String docfileName = image.path.split('/').last;

      Options options = Options(
        headers: {
          "Authorization": await getSellerToken(),
        },
        contentType: 'application/json',
      );
      FormData formData = FormData.fromMap({
        "Image":
            await MultipartFile.fromFile(image.path, filename: docfileName),
        "Category": categories,
        "Title": brandName,
      });

      final response = await dio.post(EndPoint.brandRegister,
          data: formData, options: options);

      if (response.statusCode == 200) {
        var responseJson = response.data;
        showMessagess(responseJson["success"]);
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

  Future<dynamic> verifyForgetPswd(String textEditingController) async {
    // final accessSellForgetToken = await PreferenceHelper.getSellForgetAccessToken();
    var jsonres;
    try {
      var otpMap = {"OTP": textEditingController};
      final response = await http
          .post(EndPoint.sellForgetPassVerify, body: otpMap, headers: {
        // "Authorization": accessSellForgetToken,
        "Accept": 'application/json',
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        jsonres = json.decode(response.body);
        Fluttertoast.showToast(
            backgroundColor: AppColors.primaryColor, msg: "success");
        return response;
      }
      if (response.statusCode == 406) {
        if (response.statusCode == 406) {
          showMessagess('enter otp is incorrect');
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<PremiumSeller> follow(int id) async {
    try {
      var idMap = {"Seller": id.toString()};
      final response = await http.post(
        EndPoint.followUser,
        headers: {
          "Authorization": await getAccessToken(),
          'Accept': 'application/json',
        },
        body: idMap,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        //    final jsonres = json.decode(response.body);
        Fluttertoast.showToast(
            backgroundColor: AppColors.primaryColor, msg: "success");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<PremiumSeller> getPremiunSeller() async {
    try {
      final response = await http
          .get(EndPoint.premiumSeller, headers: {'Accept': 'Application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);
        return PremiumSeller.fromJson(res);
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> getSellerFollower() async {
    final token = await getSellerToken();

    try {
      final response = await http.get(EndPoint.followerSellerGet,
          headers: {"Authorization": token, 'Accept': 'Application/json'});
      if (response.statusCode == 200) {}
      if (response.statusCode == 500) {
        showMessagess('Server Error');
      }
      if (response.statusCode == 404) {
        showMessagess('Not Found');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> getFolloweing() async {
    final token = await getSellerToken();

    try {
      final response = await http.get(EndPoint.followingGetUser,
          headers: {"Authorization": token, 'Accept': 'Application/json'});
      if (response.statusCode == 200) {}
      if (response.statusCode == 500) {
        showMessagess('Server Error');
      }
      if (response.statusCode == 404) {
        showMessagess('Not Found');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<SellerDash> getSellerShop(int id) async {
    final token = await getAccessToken();

    try {
      final response = await http.get(EndPoint.sellerShopDash + "$id",
          headers: {"Authorization": token, 'Accept': 'Application/json'});
      if (response.statusCode == 200) {
        final res = json.decode(response.body);
        return SellerDash.fromJson(res);
      }
      if (response.statusCode == 500) {
        showMessagess('Internal Server Error');
      }
      if (response.statusCode == 404) {
        showMessagess('Not Found');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Member>> getMember() async {
    try {
      final response = await http.get(
        EndPoint.getTeamMemer,
        headers: {
          "Authorization": await PreferenceHelper.getSellAccessToken(),
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body) as List;
        return List.generate(res.length, (index) {
          return Member.fromJson(res[index]);
        }).toList();
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> onMemberRegister(
      String memberNo, String password, String sellerNo) async {
    Map _map = {
      'PhoneNo': memberNo,
      'Password': password,
      'Seller': sellerNo,
    };
    try {
      final response = await http
          .post(EndPoint.memberSignUp, body: json.encode(_map), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonString = json.decode(response.body);
        showMessagess("Success");
        print(jsonString["otp"]);
        await PreferenceHelper.setMemberAccessToken(
            jsonString["token"]["access"]);
        return response;
      } else {
        showMessagess("Try Again");
      }
      if (response.statusCode == 404) {
        showMessagess("Seller with this not Register");
      }
      if (response.statusCode == 500) {
        showMessagess("Already Exist");
      }
    } catch (e) {
      throw Exception("cancell SignUp");
    }
  }

  Future<dynamic> otpMemberRegister(String textEditingController) async {
    final accessMemberToken = await getMemberToken();
    var jsonres;
    try {
      var otpMap = {"OTP": textEditingController};
      final response =
          await http.post(EndPoint.memberOtpVerify, body: otpMap, headers: {
        "Authorization": accessMemberToken,
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        jsonres = json.decode(response.body);
        await PreferenceHelper.setMemberAccessToken(jsonres["token"]['access']);
        showMessagess('Success');
        return jsonres['success'];
      }
      if (response.statusCode == 406) {
        showMessagess('Incorrect OTP');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> memberLogin(String no, String password) async {
    Map _map = {
      'PhoneNo': no,
      'Password': password,
    };
    try {
      final response = await http
          .post(EndPoint.memberLogin, body: json.encode(_map), headers: {
        'content-type': 'application/json',
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        showMessagess('login');
        final jsonString = json.decode(response.body);
        print(jsonString["token"]["access"]);
        await PreferenceHelper.setMemberAccessToken(
            jsonString["token"]["access"]);
        return response;
      } else if (response.statusCode == 406) {
        showMessagess('Invalid Member or Password');
      }
    } catch (e) {
      showMessagess('Invalid');
    }
  }

  static Future memberForgetPassword(String no, String password) async {
    Map _map = {
      'PhoneNo': no,
      'Password': password,
    };
    try {
      final response = await http.post(EndPoint.forgetMemberPassword,
          body: json.encode(_map),
          headers: {
            'content-type': 'application/json',
            'Accept': 'application/json',
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonString = json.decode(response.body);
        showMessagess('otp sent');
        print(jsonString["otp"]);
        print(jsonString["token"]["access"]);
        await PreferenceHelper.setMemberAccessToken(
            jsonString["token"]["access"]);
        // showMessagess(jsonString["Sucess"]);
      } else if (response.statusCode == 404) {
        showMessagess('Seller with this number not exist');
      }
    } catch (e) {
      throw Exception("Failed To changed password");
    }
  }

  Future<dynamic> verifyMemberForgetPassword(
      String textEditingController) async {
    final accessMemberToken = await getMemberToken();
    var jsonres;
    try {
      var otpMap = {"OTP": textEditingController};
      final response = await http
          .post(EndPoint.frogetMemberPasswordVerify, body: otpMap, headers: {
        "Authorization": accessMemberToken,
        'Accept': 'Application/json',
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        jsonres = json.decode(response.body);
        Fluttertoast.showToast(
            backgroundColor: AppColors.primaryColor, msg: "sucess");
        return jsonres['sucess'];
      }
      if (response.statusCode == 406) {
        Fluttertoast.showToast(msg: 'enter otp is incorrect');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> removeMember(int id) async {
    final accessSellerToken = await getSellerToken();
    try {
      var idMap = {'id': id.toString()};
      final response = await http.post(
        EndPoint.removeMember,
        headers: {
          "Authorization": accessSellerToken,
          'Accept': 'application/json',
        },
        body: idMap,
      );
      if (response.statusCode == 200) {
        showMessagess('Member Remove');
      }
      if (response.statusCode == 403) {
        showMessagess('You do not have permission to perform this action');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<SellerProfile> getSellerProfileInfo() async {
    try {
      final response = await http.get(
        EndPoint.sellerProfileGet,
        headers: {
          "Authorization": await getSellerToken(),
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final res = json.decode(response.body);
        return SellerProfile.fromJson(res);
      } else {
        print(response.statusCode.toString());
      }
      if (response.statusCode == 404) {
        showMessagess('Not Found');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
