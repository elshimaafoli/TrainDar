import 'package:http/http.dart' as http;
import 'package:traindar_app/models/users/user.dart';
import 'dart:convert';
import 'package:traindar_app/uris.dart';

class UserAPI {
  static int currentUserId = 0;

  //get id
  Future<bool> loginUser(String email, String password) async {
    final response = await http.post(
        Uri.parse(URI.login),
        body: jsonEncode(<String, dynamic>{
          'email': email,
          'password': password,
        }),
        headers: URI.headers);
    if (response.statusCode == 200) {
      print(response.body);
      var responseBody = jsonDecode(response.body);
      currentUserId = responseBody as int;
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  Future<bool> createUser({required var body}) async {
    http.Response response = await http.post(
        Uri.parse(URI.createUser),
        body: body,
        headers: URI.headers);
    if (response.statusCode == 200) {
      print(response.body);
      return true;
    }
    return false;
  }

  Future<User> getData(int id) async {
    final response = await http.get(
        Uri.parse(URI.getUserData+"$id"),
        headers: URI.headers);
    var body = User.fromJson(jsonDecode(response.body));
    print(body.id);
    return body;
  }
}
