import 'dart:convert';

import 'package:digitalkarobaar/src/core/endpoint/end_points.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/models/order_address.dart';
import 'package:digitalkarobaar/src/models/order_res.dart';
import 'package:digitalkarobaar/src/models/product_cart.dart';
import 'package:digitalkarobaar/src/models/seller_order.dart';
import 'package:http/http.dart' as http;

class ProductOrderRepository {
  confirmplaceOrder(List<Map<String, dynamic>> list) async {
    try {
      var body = json.encode({"data": list});
      final response = await http.post(EndPoint.order,
          headers: {
            'Content-type': 'application/json',
            "Authorization": await getAccessToken(),
            'Accept': 'Application/json'
          },
          body: body);

      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        return OrderResponce.fromJson(res);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }

  confirmpayment(Map<String, dynamic> data) async {
    try {
      var body = json.encode(data);
      final response = await http.post(EndPoint.payment,
          headers: {
            'Content-type': 'application/json',
            "Authorization": await getAccessToken(),
            'Accept': 'Application/json'
          },
          body: body);

      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        return res["success"];
        //Fluttertoast.showToast(msg: res["success"]);
      }
    } catch (e) {
      throw Exception();
    }
  }

  addToCart(String id) async {
    try {
      final response = await http.post(EndPoint.addToCart, headers: {
        "Authorization": await getAccessToken(),
        'Accept': 'Application/json'
      }, body: {
        "ProductId": id
      });
      return _handleResponse(response);
    } catch (e) {
      throw Exception();
    }
  }

  removeToCart(String productId) async {
    try {
      final response = await http.post(EndPoint.removeCartItems, headers: {
        "Authorization": await getAccessToken(),
        'Accept': 'Application/json'
      }, body: {
        "ProductId": productId
      });
      return _handleResponse(response);
    } catch (e) {
      throw Exception();
    }
  }

  Future<ProductCart> getToCart() async {
    try {
      final response = await http.get(EndPoint.getCartItems, headers: {
        "Authorization": await getAccessToken(),
        'Accept': 'Application/json'
      });

      if (response.statusCode == 200) {
        final res = json.decode(response.body);

        return ProductCart.fromJson(res);
      }
      if (response.statusCode == 500) {
        showMessagess('No items in Cart');
        throw 'No items in Cart';
      }
      return _handleResponse(response);
    } catch (e) {
      Future<ProductCart> getToCart() async {
        try {
          final response = await http.get(EndPoint.getCartItems, headers: {
            "Authorization": await getAccessToken(),
            'Accept': 'Application/json'
          });

          if (response.statusCode == 200) {
            final res = json.decode(response.body);

            return ProductCart.fromJson(res);
          }
          // return _handleResponse(response);
        } catch (e) {
          throw Exception();
        }
      }

      throw Exception();
    }
  }

  Future<List<OrderAddress>> getdeliveryAddress() async {
    final token = await getAccessToken();

    try {
      final response = await http.get(
        EndPoint.getOrderAdd,
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final res = json.decode(response.body);
        return List.generate(res.length, (index) {
          return OrderAddress.fromJson(res[index]);
        }).toList();
      }
      if (response.statusCode == 500) {
        showMessagess('');
      }
    } catch (e) {
      throw Exception("Sarver Failed");
    }
  }

  static Future<List<SellerOrder>> getOrderProducts() async {
    final token = await getSellerToken();

    try {
      final response = await http.get(
        EndPoint.orderSeller,
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final res = json.decode(response.body);
        return List.generate(res.length, (index) {
          return SellerOrder.fromJson(res[index]);
        }).toList();
      }
      if (response.statusCode == 500 || response.statusCode == 404) {
        showMessagess('');
      }
    } catch (e) {
      throw Exception("Sarver Failed");
    }
  }

  _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      final res = json.decode(response.body);
      showMessagess(res["success"] ?? 'item already exist in cart');
      // return res["success"];
    } else if (response.statusCode == 406) {
      final res = json.decode(response.body);
      showMessagess(res["detail"]);
      return res["detail"];
    } else if (response.statusCode == 500) {
      showMessagess('Server Error');
      return "error";
    } else {
      showMessagess('Error');
      return "error";
    }
  }
}
