
// import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
import '../resources/HttpErrors.dart';

class HttpResponse{
  static getResponse(Response? response) {
    switch (response?.statusCode) {
      case 200:
        var responseJson = json.decode(response?.data);
        return responseJson;
      case 400:
        throw BadRequestException(response?.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response?.data.toString());
      case 500:
      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response?.statusCode}');
    }
  }
}

