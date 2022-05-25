// To parse this JSON data, do
//
//     final nearestStations = nearestStationsFromJson(jsonString);

import 'dart:convert';

NearestStations nearestStationsFromJson(String str) => NearestStations.fromJson(json.decode(str));

String nearestStationsToJson(NearestStations data) => json.encode(data.toJson());

class NearestStations {
  NearestStations({
    required this.name,
    required this.timeLeft,
  });

  String name;
  String timeLeft;

  factory NearestStations.fromJson(Map<String, dynamic> json) => NearestStations(
    name: json["name"],
    timeLeft: json["timeLeft"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "timeLeft": timeLeft,
  };
}
