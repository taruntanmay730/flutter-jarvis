
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jarvis/analytics/google_sign_in.dart';
import 'package:jarvis/common/Storage/LoginHelper.dart';
import 'package:jarvis/main.dart';
import 'package:provider/provider.dart';

class ProfileController extends StatefulWidget {
  const ProfileController({Key? key}) : super(key: key);

  @override
  State<ProfileController> createState() => _ProfileControllerState();
}

class _ProfileControllerState extends State<ProfileController> {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile",
          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
        ),
        actions: [
          ElevatedButton(onPressed: (){
            logoutListner();
          },child: Text("Logout", style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold)))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user?.photoURL! ?? ""),
            ),
            SizedBox(height: 8),
            Text("Hello, " + (user?.displayName! ?? "User"), style: TextStyle(color: Colors.green, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Future<void> logoutListner() async {
    bool logout = await LoginHelper.logOut();
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);

    if (logout == true){
      provider.logout();
      print("logged out successfully!");
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
      const MyApp()), (Route<dynamic> route) => false);
    }else{
      print("Failed to logout!");
    }
  }
}
