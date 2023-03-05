import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatefulWidget {

  final String info;
  final Icon icon;

  const ProductInfo({Key? key, required this.info, required this.icon}) : super(key: key);

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Card (
              margin: EdgeInsets.all(16),
              color: Colors.white,
              shadowColor: Colors.white30,
              elevation: 6,
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  ListTile(
                    leading: Icon (
                        Icons.album,
                        color: Colors.cyan,
                        size: 20
                    ),
                    title: Text(
                      "Let's Talk About Love",
                      style: TextStyle(fontSize: 12),
                    ),
                    subtitle: Text('Modern Talking Album', style: TextStyle(fontSize: 10),),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
