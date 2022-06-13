// To parse this JSON data, do
//
//     final nearestStations = nearestStationsFromJson(jsonString);

import 'dart:convert';

NearStations nearStationsFromJson(String str) => NearStations.fromJson(json.decode(str));

String nearStationsToJson(NearStations data) => json.encode(data.toJson());

class NearStations {
  NearStations({
    required this.name,
    required this.timeLeft,
  });

  String name;
  String timeLeft;

  factory NearStations.fromJson(Map<String, dynamic> json) => NearStations(
    name: json["name"],
    timeLeft: json["timeLeft"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "timeLeft": timeLeft,
  };
}
