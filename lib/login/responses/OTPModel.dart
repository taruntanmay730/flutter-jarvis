
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class OTPModel {
  OTPModel({
    required this.message,
  });

  @JsonKey(name: 'message')
  String message;

  factory OTPModel.fromJson(String json) => OTPModel(
    message: json
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
