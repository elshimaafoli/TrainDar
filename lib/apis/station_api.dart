import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:traindar_app/apis/userAPI.dart';
import 'package:traindar_app/models/station/close_stations.dart';
import 'package:traindar_app/models/train/nearby_trains.dart';
import '../uris.dart';

class StationAPI {
  Future<List<String>> getStation() async {
    List<String> stations = [];
    var response = await http.get(
      Uri.parse(URI.getNameStations),
      headers: URI.headers,
    );
    var body = jsonDecode(response.body);
    for (var item in body) {
      stations.add(item);
    }
    return stations.toList();
  }

  Future<List<NearbyTrains>> getNearbyTrains(
      {required String station1, required String station2}) async {
    List<NearbyTrains> nearbyTrains = [];
    var response = await http.get(
      Uri.parse(
          "https://train-dar.azurewebsites.net/api/v1/train/show-upcoming-trains?"
              "user-id=${UserAPI.currentUserId}"
              "&first-city=$station1"
              "&second-city=$station2"),
      headers: URI.headers,
    );
       if(response.statusCode==200) {
      var body = jsonDecode(response.body);
      for (var item in body) {
        nearbyTrains.add(NearbyTrains.fromJson(item));
      }
      return nearbyTrains.toList();
    }
       nearbyTrains.add(NearbyTrains(trainId: 0, timeLeft: '0'));
    return nearbyTrains.toList();
  }

  Future<List<CloseStations>> getNearestStations({required int trainId}) async {
    List<CloseStations> nearestStations = [];
    var response = await http.get(
      Uri.parse(
          "https://train-dar.azurewebsites.net/api/v1/station/nearest-stations?"
              "user-id=${UserAPI.currentUserId}"
              "&train-id=$trainId"),
      headers: URI.headers,
    );
     var body = jsonDecode(response.body);
       for (var item in body) {
         nearestStations.add(CloseStations.fromJson(item));
       }
    return nearestStations.toList();
  }
}
