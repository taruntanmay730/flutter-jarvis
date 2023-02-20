
import 'package:json_annotation/json_annotation.dart';
import 'LoginModel.dart';

@JsonSerializable()
class LoginResponse {

  LoginModel? data;

  LoginResponse({required this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    data?.code = json["code"];
    data?.name = json["name"];
    data?.token = json["token"];
    data?.number = json["number"];
  }

  Map<String, dynamic>? toJson() {
    Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.data != null) {
      data = this.data?.toJson();
    }
    return data;
  }
}