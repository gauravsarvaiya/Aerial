// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  String? message;
  String? accessToken;
  int? expiresIn;
  String? tokenType;
  String? refreshToken;
  String? idToken;

  LoginResponseModel({
    this.message,
    this.accessToken,
    this.expiresIn,
    this.tokenType,
    this.refreshToken,
    this.idToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    message: json["message"],
    accessToken: json["AccessToken"],
    expiresIn: json["ExpiresIn"],
    tokenType: json["TokenType"],
    refreshToken: json["RefreshToken"],
    idToken: json["IdToken"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "AccessToken": accessToken,
    "ExpiresIn": expiresIn,
    "TokenType": tokenType,
    "RefreshToken": refreshToken,
    "IdToken": idToken,
  };
}
