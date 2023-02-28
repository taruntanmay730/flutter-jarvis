import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FasTag/FastagDashboard.dart';
import 'GPS/GPSDashboard.dart';

class TripsController extends StatefulWidget {
  const TripsController({Key? key}) : super(key: key);

  @override
  State<TripsController> createState() => _TripsControllerState();
}

class _TripsControllerState extends State<TripsController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(title: Text("My Orders", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold))),
          body: Column(
            children: [
              TabBar(
                unselectedLabelColor: Colors.black26,
                labelColor: Colors.black,
                tabs: [
                  Tab(text: "FasTag"),
                  Tab(text: "GPS")
                ],),
              Expanded(child: TabBarView(children: [FastagDashboard(), GPSDashboard()]))
            ],
          ),
        )
    );
  }
}
