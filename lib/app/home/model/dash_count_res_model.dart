// To parse this JSON data, do
//
//     final dashCountResModel = dashCountResModelFromJson(jsonString);

import 'dart:convert';

DashCountResModel dashCountResModelFromJson(String str) => DashCountResModel.fromJson(json.decode(str));

String dashCountResModelToJson(DashCountResModel data) => json.encode(data.toJson());

class DashCountResModel {
  int? statusCode;
  String? message;
  Data? data;

  DashCountResModel({
    this.statusCode,
    this.message,
    this.data,
  });

  factory DashCountResModel.fromJson(Map<String, dynamic> json) => DashCountResModel(
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
  int? totalCompletedInquiry;
  int? totalPendingTicket;
  int? totalInquiry;
  int? totalTicket;

  Data({
    this.totalCompletedInquiry,
    this.totalPendingTicket,
    this.totalInquiry,
    this.totalTicket,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalCompletedInquiry: json["totalCompletedInquiry"],
    totalPendingTicket: json["totalPendingTicket"],
    totalInquiry: json["totalInquiry"],
    totalTicket: json["totalTicket"],
  );

  Map<String, dynamic> toJson() => {
    "totalCompletedInquiry": totalCompletedInquiry,
    "totalPendingTicket": totalPendingTicket,
    "totalInquiry": totalInquiry,
    "totalTicket": totalTicket,
  };
}
