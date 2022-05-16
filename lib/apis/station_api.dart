import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:traindar_app/models/station/station.dart';
import 'package:traindar_app/models/train/nearby_trains.dart';
import '../uris.dart';

class StationAPI {
  List<String> Stations = <String>[];
  Future<List<String>> getStation() async {
    var response = await http.get(
      Uri.parse(URI.getNameStations),
      headers: URI.headers,
    );
    var body = jsonDecode(response.body);
    for (var item in body) {
      Stations.add(Station.fromJson(item).name);
    }
    return Stations.toList();
  }

  Future<List<NearbyTrains>> getNearbyTrains(
      {required String station1, required String station2}) async {
    List<NearbyTrains> nearbyTrains = [];
    var response = await http.get(
      Uri.parse(
          "https://train-dar.azurewebsites.net/api/v1/train/show-upcoming-trains?"
          "first-city=$station1"
          "&second-city=$station2"),
      headers: URI.headers,
    );
    print(response.body);
    var body = jsonDecode(response.body);
    for (var item in body) {
      nearbyTrains.add(NearbyTrains.fromJson(body));
    }

    return nearbyTrains.toList();
  }
}
