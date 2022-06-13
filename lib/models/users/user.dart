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
  });

  int id;
  int points;
  String name;
  String email;
  String password;
  String phone;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    points: json["points"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "points": points,
    "name": name,
    "email": email,
    "password": password,
    "phone": phone,

  };
}
