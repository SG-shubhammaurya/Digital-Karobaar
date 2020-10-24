import 'dart:convert';
import 'dart:io';
import 'package:digitalkarobaar/src/core/endpoint/end_points.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/models/user_return_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class OrderReturnRepo {
   static final OrderReturnRepo _singleton = OrderReturnRepo._internal();

  factory OrderReturnRepo() {
    return _singleton;
  }

 OrderReturnRepo._internal();

   Future returnPost(String path, String message, String orderId) async {
    try {
      Dio dio = Dio();
      String docfileName = path.split('/').last;

      Options options = Options(
        headers: {
          "Authorization": 
          await getAccessToken(),
        },
        contentType: 'application/json',
      );
      FormData formData = FormData.fromMap({
        "File": await MultipartFile.fromFile(path, filename: docfileName),
        "Message": message,
        "Order": orderId,
      });

      final response = await dio.post(EndPoint.postUserReturn,
          data: formData, options: options);

      if (response.statusCode == 200) {
        //var responseJson = response.data;
        showMessagess("success");

        return response;
      } else {
        showMessagess("somthing wrong");
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404 || e.response.statusCode == 400) {
        showMessagess("somthing wrong");
      }
      showMessagess(e.response.statusMessage.toString());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<UserReturnModel>> getUserReturn() async {
    try {
      final response = await http.get(
        EndPoint.getUserReturn,
        headers: {
          'Authorization': await getAccessToken(),
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final res = json.decode(response.body);
        return List.generate(res.length, (index) {
          return UserReturnModel.fromJson(res[index]);
        }).toList();
      }
      if (response.statusCode == 500 || response.statusCode == 404) {
        showMessagess('');
      }
    } catch (e) {
      throw Exception("Sarver Failed");
    }
  }
}
