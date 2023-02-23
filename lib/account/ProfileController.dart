
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

import '../common/Storage/LoginHelper.dart';

class ProfileController extends StatefulWidget {
  const ProfileController({Key? key}) : super(key: key);

  @override
  State<ProfileController> createState() => _ProfileControllerState();
}

class _ProfileControllerState extends State<ProfileController> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile",
          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
        ),
      ),


      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: const [
                  SizedBox(
                    child: CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage('lib/assets/avatar.png'),
                    ),
                  ),
                  SizedBox(
                    child: Icon(
                      LineAwesomeIcons.pen,
                      color: Colors.black26,
                      size: 32,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
