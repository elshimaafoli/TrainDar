// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
     this.points=500,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    this.locationLat=-1,
    this.locationLng=-1,
    this.locked=true,
    this.enabled=true,
    //this.pointsHistory=[],
    this.accountNonExpired=true,
    this.credentialsNonExpired=true,
    this.username='',
    this.accountNonLocked=false,
    this.authorities,
  });

  int id;
  int points;
  String name;
  String email;
  String password;
  String phone;
  int locationLat;
  int locationLng;
  bool locked;
  bool enabled;
 // List<dynamic> pointsHistory;
  bool accountNonExpired;
  bool credentialsNonExpired;
  String username;
  bool accountNonLocked;
  dynamic authorities;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    points: json["points"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    locationLat: json["locationLat"],
    locationLng: json["locationLng"],
    locked: json["locked"],
    enabled: json["enabled"],
    //pointsHistory: List<dynamic>.from(json["pointsHistory"].map((x) => x)),
    accountNonExpired: json["accountNonExpired"],
    credentialsNonExpired: json["credentialsNonExpired"],
    username: json["username"],
    accountNonLocked: json["accountNonLocked"],
    authorities: json["authorities"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "points": points,
    "name": name,
    "email": email,
    "password": password,
    "phone": phone,
    "locationLat": locationLat,
    "locationLng": locationLng,
    "locked": locked,
    "enabled": enabled,
    //"pointsHistory": List<dynamic>.from(pointsHistory.map((x) => x)),
    "accountNonExpired": accountNonExpired,
    "credentialsNonExpired": credentialsNonExpired,
    "username": username,
    "accountNonLocked": accountNonLocked,
    "authorities": authorities,
  };
}
