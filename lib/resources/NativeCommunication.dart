
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeCommunication extends StatefulWidget {
  const NativeCommunication({Key? key}) : super(key: key);

  @override
  State<NativeCommunication> createState() => _NativeCommunicationState();
}

class _NativeCommunicationState extends State<NativeCommunication> {
  String iOSMessage = '';
  String iOSToFlutterMessage = '';

  String androidMessage = '';
  String androidToFlutterMessage = '';

  static const iOSPlatform = MethodChannel("test.flutter.ios.communication");
  static const androidPlatform = MethodChannel("test.flutter.android.communication");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initNativeMethodHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat with native", textAlign: TextAlign.left)),
      body: Container(
        padding: const EdgeInsets.only(left: 10,top: 10),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await getMessageFromiOS();
                setState(() {});
              },
              child: const Text('call iOS from flutter'),
            ),
            const SizedBox(height: 10),
            Text(iOSMessage),

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await sendMessageFromiOS();
                setState(() {});
              },
              child: const Text('call flutter from iOS'),
            ),
            const SizedBox(height: 10),
            Text(iOSToFlutterMessage),





            ElevatedButton(
              onPressed: () async {
                await getMessageFromAndroid();
                setState(() {});
              },
              child: const Text('call android from flutter'),
            ),
            const SizedBox(height: 10),
            Text("$androidMessage"),


            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await sendMessageFromAndroid();
                setState(() {});
              },
              child: const Text('call flutter from android'),
            ),
            const SizedBox(height: 10),
            Text(androidToFlutterMessage),
          ],
        ),
      ),
    );
  }



  Future<void> sendMessageFromiOS() async {
    try{
      iOSPlatform.setMethodCallHandler(_didRecieveiOSCall);
    }on PlatformException catch(e){
      iOSToFlutterMessage = "Failed Communication: $e";
    }
  }

  Future<dynamic> _didRecieveiOSCall(MethodCall methodCall) async {
    switch (methodCall.method) {
      case 'didRecieveiOSCall':
        iOSToFlutterMessage = methodCall.arguments.toString();
        return null; // could return a value here
      default:
        throw PlatformException(code: 'notimpl', message: 'not implemented');
    }
  }

  Future<void> getMessageFromiOS() async {
    try{
      iOSMessage = await iOSPlatform.invokeMethod('getiOSMessage');

    }on PlatformException catch(e){
      iOSMessage = "Failed Communication: $e";
    }
  }



  Future<void> sendMessageFromAndroid() async {
    try{
      androidPlatform.setMethodCallHandler(_didRecieveAndroidCall);
    }on PlatformException catch(e){
      androidToFlutterMessage = "Failed Communication: $e";
    }
  }

  Future<dynamic> _didRecieveAndroidCall(MethodCall methodCall) async {
    switch (methodCall.method) {
      case 'didRecieveAndroidCall':
        androidToFlutterMessage = methodCall.arguments;
        return null; // could return a value here

      default:
        throw PlatformException(code: 'notimpl', message: 'not implemented');
    }
  }


  Future<void> getMessageFromAndroid() async {
    try{
      androidMessage = await androidPlatform.invokeMethod('getAndroidMessage');

    }on PlatformException catch(e){
      androidMessage = "Failed Communication: $e";
    }
  }
}
