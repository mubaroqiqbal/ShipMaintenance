import 'package:flutter/material.dart';
import 'package:ship_maintenance/infrastructure/colors.dart';
import 'package:ship_maintenance/view/activity/guideline/guideline_book.dart';
import 'package:ship_maintenance/view/activity/guideline/guideline_video.dart';
import 'package:ship_maintenance/view/activity/message_activity.dart';

class GuidelineActivity extends StatefulWidget {

  static TabController controller;

  @override
  _GuidelineActivity createState() => _GuidelineActivity();
}

class _GuidelineActivity extends State<GuidelineActivity> with SingleTickerProviderStateMixin {

  @override
  void initState(){
    GuidelineActivity.controller = new TabController(vsync: this, length: 2);

    super.initState();
  }

  @override
  void dispose(){
    GuidelineActivity.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.of(context).size;

    return new Scaffold(
      //create appBar
      appBar: new AppBar(
        centerTitle: false,
        elevation: 0.0,
        titleSpacing: 0.0,
        title: Text("Lihat Panduan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
        backgroundColor: colors.primaryBlue,
        iconTheme: new IconThemeData(color: Colors.white),
        leading: IconButton(icon:Icon(Icons.arrow_back_ios),
          onPressed:() => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.chat_bubble, color: Colors.white,),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MessageActivity()));
            },
          )
        ],
        bottom: PreferredSize(
          child: Container(
            color: Colors.white,
            child: new TabBar(
              onTap: ((value){
                setState(() {
                  GuidelineActivity.controller.index = value;
                });
              }),
              controller: GuidelineActivity.controller,
              labelColor: colors.textColor,
              //source code lanjutan
              tabs: <Widget>[
                new Tab(
                  text: "Video Panduan",
                ),
                new Tab(
                  text: "Buku Panduan",
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(40.0)
        ),
      ),
      backgroundColor: Colors.white,
      body: new TabBarView(
        //controller untuk tab bar
        controller: GuidelineActivity.controller,
        children: <Widget>[
          new GuidelineVideo(),
          new GuidelineBook()
        ],
      ),
    );
  }


}