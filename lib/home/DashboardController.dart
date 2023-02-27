import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DashboardController extends StatefulWidget {
  const DashboardController({Key? key}) : super(key: key);

  @override
  State<DashboardController> createState() => _DashboardControllerState();
}

class _DashboardControllerState extends State<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dashboard!",
            style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
          ),
        ),
      body: Text("Dashboard"),
    );
  }
}
