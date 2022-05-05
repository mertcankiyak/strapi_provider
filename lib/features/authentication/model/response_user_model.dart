// To parse this JSON data, do
//
//     final responseUserModel = responseUserModelFromJson(jsonString);

import 'dart:convert';

import 'package:vexana/vexana.dart';

ResponseUserModel responseUserModelFromJson(String str) => ResponseUserModel.fromJson(json.decode(str));

String responseUserModelToJson(ResponseUserModel data) => json.encode(data.toJson());

class ResponseUserModel extends INetworkModel {
  ResponseUserModel({
    this.jwt,
    this.user,
  });

  String? jwt;
  User? user;

  factory ResponseUserModel.fromJson(Map<String, dynamic> json) => ResponseUserModel(
    jwt: json["jwt"] == null ? null : json["jwt"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "jwt": jwt == null ? null : jwt,
    "user": user == null ? null : user?.toJson(),
  };

  @override
  fromJson(Map<String, dynamic> json) {
    return ResponseUserModel.fromJson(json);
  }
}

class User {
  User({
    this.id,
    this.username,
    this.email,
    this.provider,
    this.confirmed,
    this.blocked,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  bool? blocked;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    username: json["username"] == null ? null : json["username"],
    email: json["email"] == null ? null : json["email"],
    provider: json["provider"] == null ? null : json["provider"],
    confirmed: json["confirmed"] == null ? null : json["confirmed"],
    blocked: json["blocked"] == null ? null : json["blocked"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "username": username == null ? null : username,
    "email": email == null ? null : email,
    "provider": provider == null ? null : provider,
    "confirmed": confirmed == null ? null : confirmed,
    "blocked": blocked == null ? null : blocked,
    "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
  };
}
