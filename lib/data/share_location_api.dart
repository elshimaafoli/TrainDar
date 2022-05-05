import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:traindar_app/data/userAPI.dart';
import '../uris.dart';

class ShareAPI {
  int userId=UserAPI.currentUserId;
  Future<bool> shareIdFirstTime(
      {required int trainId}) async {
    print(trainId);
    print(userId);
    var response = await http.put(
      Uri.parse("https://train-dar.azurewebsites.net/api/v1/train/add-user?"
          "train-id=$trainId&user-id=$userId"),
      headers: URI.headers,
    );
    if (response.body == "Added") {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> sharedLocationFirstTime({
    required double locationLat,
    required double locationLng,
  }) async {
    var response = await http.put(
      Uri.parse(
          "https://train-dar.azurewebsites.net/api/v1/user/$userId/update-location"),
      body:
        jsonEncode(<String, dynamic>{
          "locationLng" : locationLng.toString(),
          "locationLat" : locationLat.toString(),
        }),
      headers: URI.headers,
    );
    print(response.body);
    return true;
  }
}
