import 'dart:convert';

import 'package:digitalkarobaar/src/core/endpoint/end_points.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class CartRepository {
  static Future<dynamic> deliveryAddress(
      String pincode,
      String address1,
      String address2,
      String landmark,
      String city,
      String state,
      String alternatemobile) async {
    Map _map = {
      'Pincode': pincode,
      'Address1': address1,
      'Address2': address2,
      'Landmark': landmark,
      'City': city,
      'State': state,
      'AlternateMobile': alternatemobile
    };

    final token = await getAccessToken();
    try {
      final response = await http.post(
        EndPoint.deliveryAddress,
        body: json.encode(_map),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Fluttertoast.showToast(
            backgroundColor: AppColors.primaryColor, msg: 'Saved');
      }
      if (response.statusCode == 500) {
        Fluttertoast.showToast(
            backgroundColor: AppColors.primaryColor, msg: 'Sever Error');
      }
    } catch (e) {
      throw Exception("Sarver Failed");
    }
  }

  
}
