// To parse this JSON data, do
//
//     final closeStations = closeStationsFromJson(jsonString);

import 'dart:convert';

CloseStations closeStationsFromJson(String str) => CloseStations.fromJson(json.decode(str));

String closeStationsToJson(CloseStations data) => json.encode(data.toJson());

class CloseStations {
  CloseStations({
    required this.name,
    required this.timeLeft,
  });

  String name;
  String timeLeft;

  factory CloseStations.fromJson(Map<String, dynamic> json) => CloseStations(
    name: json["name"],
    timeLeft: json["timeLeft"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "timeLeft": timeLeft,
  };
}
