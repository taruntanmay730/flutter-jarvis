
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

  LoginResponse.toJson(Map<String, dynamic> data) {
    if (this.data != null) {
      this.data = data as LoginModel;
    }
  }
}