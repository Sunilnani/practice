import 'package:dio/dio.dart';
import 'package:flutter_proj/networkcalls/base_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'base_network.dart';



class LoginManager {
  Future<dynamic> createLoginToken(Map<String, dynamic> data) async {
    FormData formData = FormData.fromMap(data);
    Response response = await dioClient.tokenRef.post("https://api.github.com", data: formData,);

    if (response?.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // here the issuw is with the if statement
      // in the response we dont have a key named status  so that is the reason
      // response.data['status'] returned null when comparing this kind of dynamic data its better to user == true
      // Okay?
      print(response.data);
      if (response.data['user_status'] == 1) {
        prefs.setString("token", response.data['token']);
        print(response);
        return ResponseData("", ResponseStatus.SUCCESS,
            data: response.data);

      } else {
        return ResponseData(response.data['message'], ResponseStatus.FAILED, data: null);
      }
    } else {
      return ResponseData("Failed to get data", ResponseStatus.FAILED, data: null);
    }
  }
}

final loginManager = LoginManager();
