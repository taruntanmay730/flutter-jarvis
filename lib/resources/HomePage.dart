import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jarvis/Account/ProfileController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jarvis/Home/HomeController.dart';
import 'package:jarvis/main.dart';

import '../common/storage/UserPreferenceHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          print("ConnectionState.waiting");
          return Center(child: CircularProgressIndicator());
        }else if (snapshot.hasData){
          print("snapshot.hasData");
          UserPreferenceHelper.instance.saveLoginObject(snapshot.hasData.toString());
          return MyApp();
        }else if(snapshot.hasError){
          print("snapshot.hasError");
          return Center(child: Text("Something went wrong"));
        }else{
          print("else home");
        }
        return const MyApp();
      },
    ),
  );
}
