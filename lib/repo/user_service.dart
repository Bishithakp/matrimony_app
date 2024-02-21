import 'dart:io';

import '../model/user_model.dart';
import '../utils/constants.dart';
import 'api_status.dart';
import 'package:http/http.dart' as http;

class UserSevices {
  static Future<Object> getUsersApi() async {
    try {
      var url = Uri.parse(USERLISTS);
      var resp = await http.get(url);
      //print(resp.body);
      if (200 == resp.statusCode) {
       // print(',,,,,,,,,,,,,,,,,,,,,');
       // print(resp.body);
        List<UserModel> userList = userModelFromJson(resp.body);
        //print(userList.length);
        return Success(response: userList, code: 200);
      } else {
        return Failure(
            code: USER_INVALID_RESPONSE, errorresponse: 'invalid Response');
      }
    } on HttpException {
      return Failure(code: NO_INTERNET, errorresponse: 'NO internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorresponse: 'Invalid Format');
    } catch (err) {
      return Failure(code: UNKNOWN_ERROR, errorresponse: err.toString());
    }
  }
}