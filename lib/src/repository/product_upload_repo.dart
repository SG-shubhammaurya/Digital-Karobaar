import 'dart:convert';
import 'package:digitalkarobaar/src/core/endpoint/end_points.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:http/http.dart' as http;
import 'package:digitalkarobaar/src/repository/product_repository.dart';

class ProductUploadRepo {
  getCategories() async {
    try {
      return await ProductRepository.getTopCategories();
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
          body: body);

      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        showMessagess(res["success"]);
        return res["success"];
      } else {
        showMessagess("Try Again");
      }
    } catch (e) {
      throw Exception();
    }
  }

  memberUplaodProducts(Map<String, dynamic> data) async {
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
      }
    } catch (e) {
      throw Exception();
    }
  }
}
