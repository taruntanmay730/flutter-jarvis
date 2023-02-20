
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginModel {

  LoginModel({
    required this.code,
    required this.name,
    required this.token,
    required this.number,
  });

  @JsonKey(name: "code")
  String? code;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "token")
  String? token;

  @JsonKey(name: "number")
  String? number;

  LoginModel.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    name = json["name"];
    token = json["token"];
    number = json["number"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["code"] = this.code;
    data["name"] = this.name;
    data["token"] = this.token;
    data["number"] = this.number;
    return data;
  }
}
