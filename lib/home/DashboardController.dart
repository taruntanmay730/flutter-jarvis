// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:another_flushbar/flushbar.dart';



class DashboardController extends StatefulWidget {
  const DashboardController({Key? key}) : super(key: key);

  @override
  State<DashboardController> createState() => _DashboardControllerState();
}

class _DashboardControllerState extends State<DashboardController> {
  final TextEditingController _addItemController = TextEditingController();
  late DocumentReference linkRef;
  List<String> videoID = [];
  bool showItem = false;
  final youtubeRegex = RegExp(r"^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?$");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My YouTube Playlist!", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold))),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: _addItemController,
              onEditingComplete: (){
                if (youtubeRegex.hasMatch(_addItemController.text)){
                  _addItem();
                }else{
                  FocusScope.of(this.context).unfocus();
                  _addItemController.clear();
                  Flushbar(
                    title: "Invalid link",
                    message: "Please provide a valid link",
                    duration: Duration(seconds: 3),
                    icon: Icon(Icons.error_outline, color: Colors.red),
                  )..show(context);
                }
              },
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                  labelText: "Your video url",
                  suffixIcon: GestureDetector(child: Icon(Icons.add, size: 32,),
                    onTap: (){
                      if (youtubeRegex.hasMatch(_addItemController.text)){
                        _addItem();
                      }
                    },
                  )
              ),
            ),
          ),
          Flexible(child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: showItem ? ListView.builder(
              itemCount: videoID.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(8),
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                      initialVideoId: YoutubePlayer.convertUrlToId(videoID[index]).toString(),
                      flags: YoutubePlayerFlags(autoPlay: false)),
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blue,
                  progressColors: ProgressBarColors(playedColor: Colors.blue, handleColor: Colors.blueAccent),
                ),
              ),
            ):CircularProgressIndicator(),
          ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    linkRef= FirebaseFirestore.instance.collection("links").doc('urls');
    super.initState();
    getData();
  }

  void _addItem() async{
    await linkRef.set({
      _addItemController.text.toString():_addItemController.text.toString()
    },SetOptions(merge: true));
    Flushbar(
        title: "Added",
        message: "updating...",
        duration: Duration(seconds: 3),
        icon: Icon(Icons.info_outline)
    )..show(context);
    setState(() {
      videoID.add(_addItemController.text);
    });
    FocusScope.of(this.context).unfocus();
    _addItemController.clear();
  }

  getData() async{
    await linkRef.get().then((value) => (value.data() as Map<String, dynamic>)?.forEach((key,value) {
      if (!videoID.contains(value)){
        videoID.add(value);
      }
    })).whenComplete(() => setState((){
      videoID.shuffle();
      showItem = true;
    }));
  }
}
