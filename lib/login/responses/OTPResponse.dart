
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'OTPModel.dart';

@JsonSerializable()
class OTPResponse {
  OTPResponse({
    required this.data,
  });

  OTPModel data;
  factory OTPResponse.fromJson(Map<String, dynamic> json) => OTPResponse(
    data: OTPModel.fromJson(json["message"]),
  );

  Map<String, dynamic> toJson() => {
    "message": data.toJson(),
  };
}