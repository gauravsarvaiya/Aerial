// To parse this JSON data, do
//
//     final baseAppResponseModel = baseAppResponseModelFromJson(jsonString);

import 'dart:convert';

BaseAppResponseModel baseAppResponseModelFromJson(String str) => BaseAppResponseModel.fromJson(json.decode(str));

String baseAppResponseModelToJson(BaseAppResponseModel data) => json.encode(data.toJson());

class BaseAppResponseModel {
  int? statusCode;
  String? message;
  Data? data;

  BaseAppResponseModel({
    this.statusCode,
    this.message,
    this.data,
  });

  factory BaseAppResponseModel.fromJson(Map<String, dynamic> json) => BaseAppResponseModel(
    statusCode: json["status_code"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data(
  );

  Map<String, dynamic> toJson() => {
  };
}
