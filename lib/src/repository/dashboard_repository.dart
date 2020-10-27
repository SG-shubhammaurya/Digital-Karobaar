import 'dart:convert';
import 'dart:io';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/core/utils/util.dart';
import 'package:digitalkarobaar/src/models/seller_document.dart';
import 'package:digitalkarobaar/src/models/seller_order_get.dart';
import 'package:digitalkarobaar/src/models/seller_profile.dart';
import 'package:digitalkarobaar/src/models/seller_returmget.dart';
import 'package:digitalkarobaar/src/models/seller_story.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:digitalkarobaar/src/core/endpoint/end_points.dart';

class DashRepository {
  static Future<SellerDocument> getSellerDocument() async {
    try {
      final response = await http.get(
        EndPoint.sellerDocumentGet,
        headers: {
          "Authorization": await getSellerToken(),
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final res = json.decode(response.body);
        return SellerDocument.fromJson(res);
      } else {
        _handleResponse(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  // static Future<List<Document>> sellerDocument() async {
  //   try {
  //     final response = await http.get(
  //       EndPoint.sellerDocumentGet,
  //       headers: {
  //         "Authorization": await getSellerToken(),
  //         'Accept': 'application/json',
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       final res = json.decode(response.body);
  //       List<dynamic> data = res["document"];
  //       return List.generate(data.length, (index){
  //         return Document.fromJson(data[index]);
  //       }).toList();
  //       //return Document.fromJson(res);
  //     } else {
  //       _handleResponse(response);
  //     }
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  static _handleResponse(http.Response response) {
    if (response.statusCode == 406 || response.statusCode == 404) {
      showMessagess('Not Found');
    } else if (response.statusCode == 500) {
      showMessagess('Not Found');
    } else {
      throw Exception();
    }
  }

  static Future<int> updateDocument(File doc, File sign, String no) async {
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
        "sign": await MultipartFile.fromFile(sign.path, filename: signfileName),
        "number": no
      });

      final response = await dio.post(EndPoint.sellerDocumentGet,
          data: formData,
          options: options,
          onSendProgress: (int sent, int total) {});

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseJson = response.data;
        showMessagess('Created');

        return responseJson["SellerDetailId"];
      } else {
        showMessagess('Try Again');
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        showMessagess('Not Found');
      }
      showMessagess('Try Again');
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<int> updateSign(File sign) async {
    try {
      Dio dio = Dio();
      String signfileName = sign.path.split('/').last;
      Options options = Options(
        headers: {
          "Authorization": await getSellerToken(),
        },
        contentType: 'application/json',
      );
      FormData formData = FormData.fromMap({
        "sign": await MultipartFile.fromFile(sign.path, filename: signfileName),
      });

      final response = await dio.post(EndPoint.sellerDocumentGet,
          data: formData,
          options: options,
          onSendProgress: (int sent, int total) {});

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseJson = response.data;
        showMessagess('Created');
        return responseJson["SellerDetailId"];
      } else {
        showMessagess('Try Again');
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        showMessagess('Not Found');
      }
      showMessagess('Try Again');
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<int> uploadDocument(File doc) async {
    try {
      Dio dio = Dio();
      String docfileName = doc.path.split('/').last;
      Options options = Options(
        headers: {
          "Authorization": await getSellerToken(),
        },
        contentType: 'application/json',
      );
      FormData formData = FormData.fromMap({
        "document":
            await MultipartFile.fromFile(doc.path, filename: docfileName),
      });

      final response = await dio.post(EndPoint.sellerDocumentGet,
          data: formData,
          options: options, onSendProgress: (int sent, int total) {
        // onUploadProgressCallback(sent, total);
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseJson = response.data;
        showMessagess('Created');
        return responseJson["SellerDetailId"];
      } else {
        showMessagess('Try Again');
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        showMessagess('Not Found');
      }
      showMessagess('Try Again');
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
        _handleResponse(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<SellerAllOrderGet>> getAllSellerOrder() async {
    try {
      final response = await http.get(
        EndPoint.sellerOrder,
        headers: {
          "Authorization": await getSellerToken(),
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final res = json.decode(response.body) as List;
        return List.generate(res.length, (index) {
          return SellerAllOrderGet.fromJson(res[index]);
        }).toList();
      } else {
        _handleResponse(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<SellerAllOrderGet>> getAllSellerOrderPending() async {
    try {
      final response = await http.get(
        EndPoint.sellerOrderPending,
        headers: {
          "Authorization": await getSellerToken(),
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final res = json.decode(response.body) as List;
        return List.generate(res.length, (index) {
          return SellerAllOrderGet.fromJson(res[index]);
        }).toList();
      } else {
        _handleResponse(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<SellerAllOrderGet>> getAllSellerOrderDelivered() async {
    try {
      final response = await http.get(
        EndPoint.sellerOrderDelevered,
        headers: {
          "Authorization": await getSellerToken(),
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body) as List;
        return List.generate(res.length, (index) {
          return SellerAllOrderGet.fromJson(res[index]);
        }).toList();
      } else {
        _handleResponse(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<SellerAllOrderGet>> getAllSellerOrderShiped() async {
    try {
      final response = await http.get(
        EndPoint.sellerOrderShiped,
        headers: {
          "Authorization": await getSellerToken(),
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final res = json.decode(response.body) as List;
        return List.generate(res.length, (index) {
          return SellerAllOrderGet.fromJson(res[index]);
        }).toList();
      } else {
        _handleResponse(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<SellerAllOrderGet>> getAllSellerOrderPlaced() async {
    try {
      final response = await http.get(
        EndPoint.sellerOrderPlaced,
        headers: {
          "Authorization": await getSellerToken(),
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final res = json.decode(response.body) as List;
        return List.generate(res.length, (index) {
          return SellerAllOrderGet.fromJson(res[index]);
        }).toList();
      } else {
        _handleResponse(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> sellerPicUpdate(File profilPic) async {
    String sellerToken = await getSellerToken();
    try {
      Dio dio = Dio();
      String docfileName = profilPic.path.split('/').last;
      Options options = Options(
        headers: {
          "Authorization": sellerToken,
        },
        contentType: 'application/json',
      );
      FormData formData = FormData.fromMap({
        "ProfilePic":
            await MultipartFile.fromFile(profilPic.path, filename: docfileName),
      });
      final response = await dio.post(EndPoint.sellerProfilePicUpdate,
          data: formData, options: options);
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.data);
        print(responseJson);
      } else {
        showMessagess('Try Agin');
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        showMessagess('Not Found');
      }
      showMessagess('Not Found');
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<SellerReturnGet>> getSellerReturn() async {
    try {
      final response = await http.get(
        EndPoint.sellerReturnGet,
        headers: {
          "Authorization": await getSellerToken(),
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final res = json.decode(response.body) as List;
        return List.generate(res.length, (index) {
          return SellerReturnGet.fromJson(res[index]);
        }).toList();
      } else {
        _handleResponse(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<SellerStory>> getSellerSoty() async {
    try {
      final response = await http.get(
        EndPoint.getSellerStory,
        headers: {
          "Authorization": await getSellerToken(),
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final res = json.decode(response.body) as List;
        return List.generate(res.length, (index) {
          return SellerStory.fromJson(res[index]);
        }).toList();
      } else {
        _handleResponse(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

 

  static Future<String> uploadStory(File image, String message) async {
    try {
      Dio dio = Dio();
      String imageName = image.path.split('/').last;
      //  String videoName = video.path.split('/').last;
      Options options = Options(
        headers: {
          "Authorization": await getSellerToken(),
        },
        contentType: 'application/json',
      );
      FormData formData = FormData.fromMap({
        //"Video": await MultipartFile.fromFile(video.path, filename: imageName),
        "File": await MultipartFile.fromFile(image.path, filename: imageName),
        "Text": message
      });
      double _progressValue = 0;
      final response = await dio.post(EndPoint.storyUpdatebySeller,
          data: formData,
          options: options, onSendProgress: (int sent, int total) {
        double __progressValue =
            Util.remap(sent.toDouble(), 0, total.toDouble(), 0, 1);

        __progressValue = double.parse(__progressValue.toStringAsFixed(2));

        if (__progressValue != _progressValue) _progressValue = __progressValue;

        showMessagess('Uploading %${(_progressValue * 100.0).toInt()}');
      });

      if (response.statusCode == 200) {
        showMessagess('updated');

        return "'updated'";
      } else {
        showMessagess('Try Again');
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 406) {
        showMessagess(e.response.data['details']);
      }
      if (e.response.statusCode == 500) {
        showMessagess('Not Found');
      }
      showMessagess('Try Again');
    } catch (e) {
      throw Exception(e);
    }
  }
//  var uri = Uri.parse(url);
//     var request = new MultipartRequest("POST", uri);

//     var multipartFile = await MultipartFile.fromPath("package", videoPath);
//     request.files.add(multipartFile);

//     StreamedResponse response = await request.send();
//     response.stream.transform(utf8.decoder).listen((value) {
//       print(value);
//     });
static Future<List<SellerReturnGet>> getSellerPendingReturn() async {
    try {
      final response = await http.get(
        //EndPoint.sellerOrderPlaced
        EndPoint.sellerPendingReturnGet,
        headers: {
          "Authorization":  await getSellerToken(),
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      // var token = await PreferenceHelper.getSellAccessToken();
      // print(token);
      if(response.statusCode == 200){
        final res = json.decode(response.body) as List;
        return List.generate(res.length,(index){
          return SellerReturnGet.fromJson(res[index]);
        }).toList();
      } else {
        _handleResponse(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  static Future<List<SellerReturnGet>> getSellerApprovedReturn() async {
    try {
      final response = await http.get(
        //EndPoint.sellerOrderPlaced
        EndPoint.sellerApprovedReturnGet,
        headers: {
          "Authorization": await getSellerToken(),
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      // var token = await PreferenceHelper.getSellAccessToken();
      // print(token);
      if(response.statusCode == 200){
        final res = json.decode(response.body) as List;
        return List.generate(res.length,(index){
          return SellerReturnGet.fromJson(res[index]);
        }).toList();
      } else {
         _handleResponse(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
