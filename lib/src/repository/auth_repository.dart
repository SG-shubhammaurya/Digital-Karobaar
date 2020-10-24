import 'dart:convert';
import 'package:digitalkarobaar/src/core/endpoint/end_points.dart';
import 'package:digitalkarobaar/src/core/utils/preference_helper.dart';
import 'package:digitalkarobaar/src/models/registration.dart';
import 'package:digitalkarobaar/src/models/term_condition.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  AuthRepository();

  Future<Registration> onRegistration(
      String name, String business, String pinCode, String regId) async {
    Registration registration = Registration();
    try {
      Map _map = {'Name': name, 'Business': business, 'PinCode': pinCode};

      Map<String, String> headers = {
        'Accept': 'application/json',
      };

      final response = await http.post(EndPoint.registration + "?id=$regId",
          body: _map,
          headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        registration = Registration.fromJson(json.decode(response.body));
        return registration;
      } else {
        throw Exception("load Failed");
      }
    } catch (e) {
      throw Exception("load Failed");
    }
  }

  //phone number
  Future<LogingForRegistration> sendPhoneNumber(String phoneNumber) async {
    try {
      Map map = {'PhoneNo': phoneNumber};

      final response = await http.post(EndPoint.phoneNumber,
          body: map,
          headers: {
            'Accept': 'application/json',
          });
      var rep;

      if (response.statusCode == 200 || response.statusCode == 201) {
        rep = json.decode(response.body);
        print(rep["success"]);
        return LogingForRegistration();
      } else {
        rep = json.decode(response.body);
        throw Exception(rep['detail']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //otp
  Future<dynamic> otpNewUser(String phoneNumber, String otp) async {
    try {
      var data = {"PhoneNo": phoneNumber, "OTP": otp};
      var resjson;
      final response = await http.post(EndPoint.verification,
          
          headers: {
            'Accept': 'application/json',
          },
          body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        resjson = json.decode(response.body);
        print(resjson["id"]);
        print(resjson["success"]);
       await PreferenceHelper.setAccessToken(resjson["token"]['access']);
        // await PreferenceHelper. setUserId(resjson["id"].toString());
     
           return resjson["id"];
      } else {
        resjson = json.decode(response.body);
        throw Exception(resjson['detail']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //term and condition

  static Future<TermCondition> getTermAndCondition() async {
    try {
      final response = await http.get(
        EndPoint.termCondition,
        headers: {
          'Content-type': 'application.json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);
        return TermCondition.fromJson(res[0]);
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> login(String phoneNumber) async {
    try {
      var data = {"PhoneNo": phoneNumber};

      final response = await http.post(EndPoint.login, body: data, headers: {
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        final jsonString = json.decode(response.body);
          print(jsonString["otp"]);
            await PreferenceHelper.setTemToken(jsonString["token"]['access']);
           //"otp sent successfully",
      
        return UserLogged();
      }
      if (response.statusCode == 404) {
       // final jsonString = json.decode(response.body);
       // print(jsonString["detail"]);
        final responseType = await sendPhoneNumber(phoneNumber);

        return responseType;
      }
    } catch (e) {
       throw Exception(e);
    }
  }

 Future<String> loginOtpVerify(String otp) async {

  final accessToken = await PreferenceHelper.getTemToken();
  print(accessToken);
  var jsonres;
    try {
      var otpMap = {"OTP": otp};

      final response =
          await http.post(EndPoint.loginOtpVerify, body: otpMap, headers: {
        "Authorization": accessToken,
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
       jsonres = json.decode(response.body);
       print( jsonres['success']);
     
        print(jsonres["token"]['access']);


         await PreferenceHelper.setAccessToken(jsonres["token"]['access']);
       return jsonres['success'];
      
      }else{
        jsonres = json.decode(response.body);
        throw Exception(response.statusCode.toString());
      }
    } catch (e) {
       throw Exception(e);
    }
  }

}



class LogingForRegistration {}

class UserLogged {}

class OtpVerification {
  final String id;
  final String success;

  const OtpVerification(this.id, this.success);
}
