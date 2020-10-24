import 'dart:convert';
import 'package:digitalkarobaar/src/core/endpoint/end_points.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/models/brand.dart';
import 'package:digitalkarobaar/src/models/categories.dart';
import 'package:digitalkarobaar/src/models/products.dart';
import 'package:digitalkarobaar/src/models/sub_categories.dart';
import 'package:digitalkarobaar/src/models/top_brands.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ProductRepository {

  static Future<List<Products>> getFilterProduct(
      String min, String max, String location) async {
    try {
      final response = await http.get(
        EndPoint.filterproduct + "min=$min&max=$max&city=$location",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body) as List;
        print(res.toString());
        return List.generate(res.length, (index) {
          return Products.fromJson(res[0][index]);
        }).toList();
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<SubCategory>> getSubCategories(String categoriesId) async {
    try {
      final response = await http.get(
        EndPoint.subCategories + "?id=$categoriesId",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);

        return List.generate(res.length, (index) {
          return SubCategory.fromJson(res[index]);
        }).toList();
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<TopBrands>> getTopBrands(String id) async {
    try {
      final response = await http.get(
        EndPoint.topBrandAccordingToSub + "?id=$id",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);

        return List.generate(res.length, (index) {
          return TopBrands.fromJson(res[index]);
        }).toList();
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }
   static Future<List<Brand>> getBrands() async {
    try {
      final response = await http.get(
        EndPoint.brand,
      );
      if (response.statusCode == 200) {
        final res = json.decode(response.body);

        return List.generate(res.length, (index) {
          return Brand.fromJson(res[index]);
        }).toList();
      } 
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Products>> getTopProducts() async {
    try {
      final response = await http.get(
        EndPoint.topProductsToSub,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);

        return List.generate(res.length, (index) {
          return Products.fromJson(res[index]);
        }).toList();
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Categories>> getTopCategories() async {
    try {
      final response = await http.get(
        EndPoint.topcategories,
        headers: {
          "Authorization":  await  getAccessToken(),
          'Content-type': 'application.json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body) as List;
         
      
      return  List.generate(res.length, (index) {
          return Categories.fromJson(res[index]);
        }).toList();
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Products>> getFavorite(int userId) async {
    try {
      final response = await http.get(
        EndPoint.getFavorite + "?id=$userId",
        headers: {
          "Authorization": await  getAccessToken(),
          'Content-type': 'application.json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final res = json.decode(response.body) as List;
        print(response.body.toString());

        return res.map((e) => Products.fromJson(e)).toList();
      } else {
       throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future postFavorite(int id) async {
    try {
      final response = await http.post(
        EndPoint.postFavorite + "?id=$id",
        headers: {
          "Authorization": await  getAccessToken(),
          'Content-type': 'application.json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);
        Fluttertoast.showToast(
            backgroundColor: AppColors.primaryColor, msg: 'Favorite Added');
        return response;
      } else {
        print(response.statusCode.toString());
      }
      if (response.statusCode == 404) {
        Fluttertoast.showToast(msg: 'Not Found');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static removeFavorite(int id) async {
    try {
      final response = await http.post(
        EndPoint.removeFavorite + "?id=$id",
        headers: {
          "Authorization": await  getAccessToken(),
          'Content-type': 'application.json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);
        Fluttertoast.showToast(
            backgroundColor: AppColors.primaryColor, msg: 'Favorite Removed');
      } 
      if (response.statusCode == 404) {
        Fluttertoast.showToast(msg: 'Not Found');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
