import 'dart:convert';
import 'package:digitalkarobaar/src/core/endpoint/end_points.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/models/message_response.dart';
import 'package:http/http.dart' as http;

class ChatRepository {
   sendMessage(String message) async {
    final accessToken =await  getAccessToken();
   
    var jsonres;
    try {
      var body = {"message": message};

      final response =
          await http.post(EndPoint.chatMessaageSend, body: body, headers: {
        "Authorization": accessToken,
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        jsonres = json.decode(response.body);
        print(jsonres['success']);
        return jsonres['success'];
      } else {
        jsonres = json.decode(response.body);
        throw Exception(jsonres['success']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

    getMessage() async {
   // List<MessageResponse> inCommingMessage;
    try {
      final response = await http.get(
        EndPoint.chatmessaageget,
        headers: {
          "Authorization":  await  getAccessToken(),
          'Content-type': 'application.json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body) as List;
        final messages= res.map((e) => MessageResponse.fromJson(e)).toList();
        return messages;
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
