import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:traindar_app/uris.dart';

class ReturnPass {
  static String CurrentEmail = "";

  Future<bool> getCode(String email) async {
    var response = await http.get(
        Uri.parse('${URI.email}'
            'email?email=$email'),
        headers: URI.headers);

    if (response.statusCode == 200) {
      CurrentEmail = email;
      print(response.body);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> ConfirmCode(String code) async {
    var response = await http.get(
        Uri.parse('${URI.code}'
            'email=$CurrentEmail'
            '&token=$code'),
        headers: URI.headers);

    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  Future<bool> NewPassword(String password) async {
    var body = {'email': CurrentEmail, 'password': password};
    var response = await http.post(
      Uri.parse(URI.newPassword),
      body: jsonEncode(body),
      headers: URI.headers,
    );
    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }
}
