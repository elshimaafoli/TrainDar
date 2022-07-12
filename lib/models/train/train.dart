// To parse this JSON data, do
//
//     final trainModel = trainModelFromJson(jsonString);

import 'dart:convert';

TrainModel trainModelFromJson(String str) => TrainModel.fromJson(json.decode(str));

String trainModelToJson(TrainModel data) => json.encode(data.toJson());

class TrainModel {
  TrainModel({
    this.id=1,
    this.locationLat=0.0,
    this.locationLng=0.0,
    this.direction='up',
    this.type='AC',
   // this.lastKnownTime=null,
    //this.sharedUsers,
  });

  int id;
  double locationLat;
  double locationLng;
  String direction;
  String type;
 // dynamic lastKnownTime;
 // List<dynamic> sharedUsers;

  factory TrainModel.fromJson(Map<String, dynamic> json) => TrainModel(
    id: json["id"],
    locationLat: json["locationLat"].toDouble(),
    locationLng: json["locationLng"].toDouble(),
    direction: json["direction"],
    type: json["type"],
  //  lastKnownTime: json["lastKnownTime"],
    //sharedUsers: List<dynamic>.from(json["sharedUsers"].map((x) => x)),
  );

  factory TrainModel.locationFromJson(Map<String, dynamic>json)=>TrainModel(
  locationLat: json["locationLat"].toDouble(),
  locationLng: json["locationLng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "locationLat": locationLat,
    "locationLng": locationLng,
    "direction": direction,
    "type": type,
   // "lastKnownTime": lastKnownTime,
   // "sharedUsers": List<dynamic>.from(sharedUsers.map((x) => x)),
  };
}
