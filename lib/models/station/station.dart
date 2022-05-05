// To parse this JSON data, do
//
//     final station = stationFromJson(jsonString);

import 'dart:convert';

Station stationFromJson(String str) => Station.fromJson(json.decode(str));

String stationToJson(Station data) => json.encode(data.toJson());

class Station {
  Station({
    required this.name,
    required this.locationLat,
    required this.locationLng,
  });

  String name;
  double locationLat;
  double locationLng;

  factory Station.fromJson(Map<String, dynamic> json) => Station(
    name: json["name"],
    locationLat: json["locationLat"],
    locationLng: json["locationLng"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "locationLat": locationLat,
    "locationLng": locationLng,
  };
}
