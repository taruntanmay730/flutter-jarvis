import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cards/ProductInfo.dart';

class FastagDashboard extends StatelessWidget {
  const FastagDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ProductInfo(info: 'Testing', icon: Icon(Icons.add)),
      ),
    );
  }
}
