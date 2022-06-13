import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:traindar_app/apis/userAPI.dart';
import '../uris.dart';

class ShareAPI {
  int userId = UserAPI.currentUserId;
  // okay 'finished'
  Future<bool> shareIdFirstTime({required int trainId}) async {
    print(trainId);
    print(userId);
    var response = await http.put(
      Uri.parse("https://train-dar.azurewebsites.net/api/v1/train/add-user?"
          "train-id=$trainId&user-id=$userId"),
      headers: URI.headers,
    );
    print(response.body);
    if (response.body == "Added") {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> sharedLocation({
    required double locationLat,
    required double locationLng,
  }) async {
    http.Response response = await http.put(
      Uri.parse(
          "https://train-dar.azurewebsites.net/api/v1/user/$userId/update-location"),
      body: jsonEncode(<String, dynamic>{
        "locationLat": locationLat.toString(),
        "locationLng": locationLng.toString(),
      }),
      headers: URI.headers,
    );
    bool result = json.decode(response.body);
    if (result) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> deleteShare({required int trainId}) async {
    var response = await http.delete(
        Uri.parse(
            "https://train-dar.azurewebsites.net/api/v1/train/delete-user?"
            "train-id=$trainId&user-id=$userId"),
        headers: URI.headers);
    print(response.body);
  }
}
