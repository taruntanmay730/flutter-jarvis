
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jarvis/Home/HomeController.dart';
import 'package:jarvis/analytics/AnalyticsService.dart';
import 'package:jarvis/login/responses/LoginResponse.dart';

import '../../common/network/model/DioClient.dart';
import '../../common/network/resources/HttpErrors.dart';
import '../../common/storage/UserPreferenceHelper.dart';
import '../responses/OTPResponse.dart';
import '../../common/network/responses/HttpResponse.dart';
import 'package:alt_sms_autofill/alt_sms_autofill.dart';

class OTPController extends StatefulWidget {
  final String phNumber;
  const OTPController({Key? key, required this.phNumber}) : super(key: key);

  @override
  State<OTPController> createState() => _OTPControllerState();
}

class _OTPControllerState extends State<OTPController> {
  TextEditingController firstOtpController = TextEditingController();
  TextEditingController secondOtpController = TextEditingController();
  TextEditingController thirdOtpController = TextEditingController();
  TextEditingController forthController = TextEditingController();

  var baseUrl = DioClient.baseUrl;
  OTPResponse? otpResponse;
  LoginResponse? loginResponse;
  late List<String> otpSplit;
  String _commingSms = 'Unknown';

  String otp = "";
  String _otpCode = "";
  final intRegex = RegExp(r'\d+', multiLine: true);

  @override
  void dispose() {
    AltSmsAutofill().unregisterListener();
    super.dispose();
  }

  Future<void> getOTP() async {
    String? commingSms;
    try {
      commingSms = await AltSmsAutofill().listenForSms;

    } on PlatformException {
      commingSms = 'Failed to get Sms.';
    }
    if (!mounted) return;

    setState(() {
      _commingSms = commingSms!;
    });
    _otpCode = _commingSms.replaceAll(new RegExp(r'[^0-9]'),'').substring(0,4);
    otpSplit = _otpCode.split('');
    firstOtpController.text = otpSplit[0];
    secondOtpController.text = otpSplit[1];
    thirdOtpController.text = otpSplit[2];
    forthController.text = otpSplit[3];
  }

  @override
  void initState() {
    super.initState();
    firstOtpController.text = "";
    secondOtpController.text = "";
    thirdOtpController.text = "";
    forthController.text = "";
    getOTP();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.blue,
        title: Text("OTP Screen", style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Form(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 64,
                height: 68,
                child: TextFormField(
                  controller: firstOtpController,
                  onChanged: (value){
                    if (value.length == 1){
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(1)],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12
                  ),
                ),
              ),SizedBox(
                width: 64,
                height: 68,
                child: TextFormField(
                  controller: secondOtpController,
                  onChanged: (value){
                    if (value.length == 1){
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(1)],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12
                  ),
                ),
              ),SizedBox(
                width: 64,
                height: 68,
                child: TextFormField(
                  controller: thirdOtpController,
                  onChanged: (value){
                    if (value.length == 1){
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(1)],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12
                  ),
                ),
              ),SizedBox(
                width: 64,
                height: 68,
                child: TextFormField(
                  controller: forthController,
                  onChanged: (value){
                    if (value.length == 1){
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(1)],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12
                  ),
                ),
              ),
            ],)
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text("OTP sent to the number ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'baloo-2'
                  ),
                ),
                Text(" " + widget.phNumber,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'baloo-2'
                  ),
                ),
              ],
            ),

          ),
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text("Didn't received OTP? ",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'baloo-2'
                    ),
                  ),
                  TextButton(onPressed: () {
                    reSendOTP(id: widget.phNumber);
                  },child:
                  Text("Resend",
                    style: TextStyle(color: Colors.black87),
                  )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(bottom: 50, left: 16, right: 16),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            onPressed: () {
              otp = (firstOtpController.text + secondOtpController.text + thirdOtpController.text + forthController.text);
              verifyOTP(otp,widget.phNumber);
            },
            child: Text("Verify",style: TextStyle(fontWeight: FontWeight.w700)),
            style: ElevatedButton.styleFrom(
                elevation: 4,
                padding: EdgeInsets.all(20)
            )
        ),
      ),
    );
  }

  void verifyOTP(String otp, String phNumber) async {
    var data = {"otp": int.parse(otp), "number": phNumber};
    var apiUrl = "$baseUrl/consigner/v1/user/login/otp";

    try {
      Response userData = await DioClient.dio.post(apiUrl, options: Options(headers: DioClient.requestHeader), data: jsonEncode(data));
      var respData = userData.data.toString();
      loginResponse = LoginResponse.fromJson(userData.data as Map<String, dynamic>);
      print("login response: $respData and token: $respData");

      if (respData != null){
        UserPreferenceHelper.instance.saveLoginObject(respData!);
        AnalyticsService("Test_Tarun_Event");
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            HomeController()), (Route<dynamic> route) => false);
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      // if (e.response != null) {
      //   otpResponse = HttpResponse.getResponse(e.response);
      // } else {
      //   // Error due to setting up or sending the request
      //   otpResponse = HttpResponse.getResponse(e.response);
      // }
      otpResponse = HttpResponse.getResponse(e.response);

    } on SocketException{
      throw FetchDataException('No Internet connection');
    }
  }

  void reSendOTP({required String id}) async {
    var apiUrl = "$baseUrl/consigner/v1/user/login/otp?number=$id";
    try {
      Response userData = await DioClient.dio.get(apiUrl);
      otpResponse = OTPResponse.fromJson(userData.data);
      String? message = otpResponse?.data.message as String;
      print("OTP send status: $message");
      otp = "";

    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      // if (e.response != null) {
      //   otpResponse = HttpResponse.getResponse(e.response);
      // } else {
      //   // Error due to setting up or sending the request
      //   otpResponse = HttpResponse.getResponse(e.response);
      // }
      otpResponse = HttpResponse.getResponse(e.response);

    } on SocketException{
      throw FetchDataException('No Internet connection');
    }
  }
}