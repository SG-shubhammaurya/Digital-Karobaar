import 'dart:convert';
import 'package:digitalkarobaar/src/core/endpoint/end_points.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:digitalkarobaar/src/repository/product_repository.dart';

import 'home_repository.dart';

class ProductUploadRepo {
  getCategories() async {
    try {
      return await HomeReposiitory.getCategories();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  getSubCategories(String categoriesId) async {
    try {
      return await ProductRepository.getSubCategories(categoriesId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  getBrand(String id) async {
    try {
      return await ProductRepository.getBrands();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  uploadProducts(Map<String, dynamic> data) async {
    try {
      var body = json.encode(data);
      final response = await http.post(EndPoint.productPost,
          headers: {
           'Content-type': 'application/json',
            "Authorization": await getSellerToken(),
            'Accept': 'Application/json'
          },
          body:body);

      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        showMessagess(res["success"]);
        return res["success"];
      } else {
        showMessagess("Try Again");
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }

  memberUplaodProducts(Map<dynamic, dynamic> data) async {
    var token = await getMemberToken();
    if (token == null) {
      showMessagess('Please Login First as a Member');
      return;
    }
    try {
      var body = json.encode(data);
      final response = await http.post(EndPoint.memberProductPost,
          headers: {
            'Content-type': 'application/json',
            "Authorization": await getMemberToken(),
            'Accept': 'Application/json'
          },
          body: body);

      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        showMessagess(res["success"]);
        return res["success"];
      } else {
        showMessagess("Try Again");
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future uploadProduct(FormData formData) async {
    try {
      Dio dio = Dio();
      // String docfileName = image.path.split('/').last;

      Options options = Options(
        headers: {
          "Authorization": await getSellerToken(),
        },
        contentType: 'application/json',
      );
      //FormData formData = FormData.fromMap(data);

      final response = await dio.post(EndPoint.productPost,
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
}
