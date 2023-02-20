import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jarvis/login/controller/OTPController.dart';
import 'package:jarvis/login/responses/OTPResponse.dart';

import 'common/network/model/DioClient.dart';
import 'common/network/resources/HttpErrors.dart';
import 'common/network/responses/HttpResponse.dart';



void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Jarvis';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}



class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}



class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController phoneController = TextEditingController();
  OTPResponse? otpResponse;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: phoneController,
                decoration: const InputDecoration(
                  errorStyle: TextStyle(color: Colors.red),
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
              ),
            ),
            Container(
                height: 80,
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  child: const Text('Login with otp'),
                  onPressed: () {
                    if (phoneController.text.length != 10){
                      print("incorrect phone number");
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("incorrect phone number", style:
                        TextStyle(
                            color: Colors.red
                        ),
                        ),
                      ));
                    }else{
                      sendOTP(id: phoneController.text);
                    }
                  },
                )
            ),
          ],
        ));
  }

  void sendOTP({required String id}) async {
    var baseUrl = DioClient.baseUrl;
    var apiUrl = "$baseUrl/consigner/v1/user/login/otp?number=$id";

    try {
      Response userData = await DioClient.dio.get(apiUrl);
      otpResponse = OTPResponse.fromJson(userData.data);
      String? message = otpResponse?.data.message as String;
      if (message != null){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => OTPController(phNumber: phoneController.text))
        );
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        otpResponse = HttpResponse.getResponse(e.response);
      } else {
        // Error due to setting up or sending the request
        otpResponse = HttpResponse.getResponse(e.response);
      }
    } on SocketException{
      throw FetchDataException('No Internet connection');
    }
  }
}