import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool result;
  String token;

  UserModel({
    required this.result,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    result: json["result"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "token": token,
  };
}

