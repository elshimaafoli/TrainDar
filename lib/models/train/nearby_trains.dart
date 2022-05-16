import 'dart:convert';

List<NearbyTrains> NearbyTrainsFromJson(String str) => List<NearbyTrains>.from(json.decode(str).map((x) => NearbyTrains.fromJson(x)));

String NearbyTrainsToJson(List<NearbyTrains> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NearbyTrains {
  NearbyTrains({
    required this.trainId,
    required this.timeLeft,
  });

  int trainId;
  String timeLeft;

  factory NearbyTrains.fromJson(Map<String, dynamic> json) => NearbyTrains(
    trainId: json["trainId"],
    timeLeft: json["timeLeft"],
  );

  Map<String, dynamic> toJson() => {
    "trainId": trainId,
    "timeLeft": timeLeft,
  };

}
