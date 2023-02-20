import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileController extends StatefulWidget {
  const ProfileController({Key? key}) : super(key: key);

  @override
  State<ProfileController> createState() => _ProfileControllerState();
}

class _ProfileControllerState extends State<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Profile!",
        style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
    ),
    )
    );
  }
}
