import 'package:flutter/material.dart';
import 'package:ship_maintenance/infrastructure/colors.dart';
import 'package:ship_maintenance/view/activity/message_activity.dart';

class DetailHistoryMaintenanceActivity extends StatefulWidget {

  @override
  _DetailHistoryMaintenanceActivity createState() => _DetailHistoryMaintenanceActivity();

}

class _DetailHistoryMaintenanceActivity extends State<DetailHistoryMaintenanceActivity>{

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0.0,
        titleSpacing: 0.0,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text("Lambung Atas Garis Air", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
        ),
        backgroundColor: colors.primaryBlue,
        iconTheme: new IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.chat_bubble, color: Colors.white,),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MessageActivity()));
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    //border: Border.all(color: colors.greyTextColor),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Card(
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text("Lambung Atas Garis Air", style: TextStyle(fontWeight: FontWeight.bold)),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 0),
                              title: Container(
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                child: Text("Cek Bulanan", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                              ),
                              trailing: Text("13:17, 2 Januari 2021"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              height: (media.width*0.9)*0.5,
                              width: media.width*0.9,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Text("Feedback", style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text("Masih baik"),
                            ),
                          ],
                        ),
                      )
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}