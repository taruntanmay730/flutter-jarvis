import 'package:dio/dio.dart';
import 'package:jarvis/login/responses/OTPResponse.dart';
import 'package:jarvis/common/network/responses/HttpResponse.dart';
import 'dart:io';

import '../resources/HttpErrors.dart';

class DioClient {

  static final Dio dio = Dio();
  static const String baseUrl = "https://consigner.stage.wheelseye.in";

  static Map<String, String> requestHeader = {
    "X-APP-OS" : Platform.operatingSystem,
    "X-APP-PLATFORM" : "IOS_CONSIGNER_APP",
    "service" : "Consigner",
    "Accept" : "*/*",
    "locale" : "en",
    "Accept-Language" : "en;q=1.0",
    "X-APP-VERSION" : "2.5.0",
    "Accept-Encoding" : "gzip;q=1.0, compress;q=0.5",
  };
}