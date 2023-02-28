import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jarvis/analytics/BaseAnalyticsService.dart';
import 'package:jarvis/common/Storage/LoginHelper.dart';
import 'package:jarvis/analytics/google_sign_in.dart';
import 'package:jarvis/login/controller/OTPController.dart';
import 'package:jarvis/login/responses/OTPResponse.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:jarvis/resources/HomePage.dart';
import 'Home/HomeController.dart';
import 'common/network/model/DioClient.dart';
import 'common/network/resources/HttpErrors.dart';
import 'common/network/responses/HttpResponse.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resources/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in_ios/google_sign_in_ios.dart';
import 'package:google_sign_in_android/google_sign_in_android.dart';
// import 'package:google_sign_in_web/google_sign_in_web.dart';


// void main() => runApp(const MyApp());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Jarvis';
  static FirebaseAnalytics analytics = BaseAnalyticsService.analytics;
  static FirebaseAnalyticsObserver observer =
  FirebaseAnalyticsObserver(analytics: analytics);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const MyStatefulWidget(),
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: _title,
          home: Scaffold(
            appBar: AppBar(title: const Text(_title)),
            body:
            const MyStatefulWidget(),
          ),
        ));
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
  final anlytics = BaseAnalyticsService.analytics;


  @override
  void initState() {
    super.initState();
    firebaseInit();
  }

  Future<void> firebaseInit() async {
    anlytics.setAnalyticsCollectionEnabled(true);
    print("event configuration done.");
    anlytics.logEvent(name: "TestHome", parameters: {"testparms":"testing"});
    print("event sent");
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    if (await LoginHelper.instance.isLoggedin()){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          HomeController()), (Route<dynamic> route) => false);
    }
  }

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

            Container(
                padding: EdgeInsets.all(12),
                child: ElevatedButton.icon(
                    icon: FaIcon(FontAwesomeIcons.google, color: Colors.red,),
                    onPressed: (){
                      final provider = Provider.of<GoogleSignInProvider>(context, listen:false);
                      provider.googleLogin();
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          HomePage()), (Route<dynamic> route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 52)
                    ),
                    label: Text("Signup with google")
                )
            )
          ],
        ));
  }

  void sendOTP({required String id}) async {
    var baseUrl = DioClient.baseUrl;
    var apiUrl = "$baseUrl/consigner/v1/user/login/otp?number=$id";
    const CircularProgressIndicator();
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