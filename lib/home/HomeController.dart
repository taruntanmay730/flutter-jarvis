import 'package:flutter/material.dart';
import 'package:jarvis/Trips/TripsController.dart';

import '../Account/ProfileController.dart';
import 'DashboardController.dart';

class HomeController extends StatefulWidget {
  const HomeController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  int _selectedIndex = 1;

  //List of screen
  List<Widget> _screens = <Widget>[
    DashboardController(),
    TripsController(),
    ProfileController()
  ];

  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.black12,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              backgroundColor: Colors.black12,
              label: "My Trips"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              backgroundColor: Colors.black12,
              label: "Account"
          ),
        ],
      ),
    );
  }
}
