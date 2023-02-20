import 'package:flutter/material.dart';
import 'package:jarvis/Trips/TripsController.dart';

import '../Account/ProfileController.dart';

class HomeController extends StatefulWidget {
  const HomeController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  //List of screen
  List<Widget> _screens = [
    HomeController(),
    ProfileController(),
    TripsController()
  ];

  void _onPageChanged(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index){
    _pageController.jumpToPage(index);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Jarvis World!",
          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
        ),
      ),
      body: _screens[_selectedIndex],
      // body: PageView(
      //   controller: _pageController,
      //   children: _screens,
      //   onPageChanged: _onPageChanged,
      //   physics: NeverScrollableScrollPhysics(),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
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
        onTap: (index){
          setState(() {
            _onItemTapped(index);
            _selectedIndex  = index;
          });
        },
      ),
    );
  }
}
