import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripsController extends StatefulWidget {
  const TripsController({Key? key}) : super(key: key);

  @override
  State<TripsController> createState() => _TripsControllerState();
}

class _TripsControllerState extends State<TripsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Orders",
            style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
          ),
        )
    );
  }
}
