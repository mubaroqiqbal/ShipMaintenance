import 'package:flutter/material.dart';
import 'package:ship_maintenance/infrastructure/colors.dart';
import 'package:ship_maintenance/view/activity/history/detail_history_maintenance_activity.dart';
import 'package:ship_maintenance/view/activity/message_activity.dart';

class HistoryMaintenanceActivity extends StatefulWidget {

  @override
  _HistoryMaintenanceActivity createState() => _HistoryMaintenanceActivity();

}

class _HistoryMaintenanceActivity extends State<HistoryMaintenanceActivity>{

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
          child: Text("Lambung Kapal dan Bangunan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
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
              itemCount: 2,
              itemBuilder: (context, index){
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide( //                    <--- top side
                        color: colors.lineColor,
                        width: 0.5,
                      ),
                      bottom: BorderSide( //                    <--- top side
                        color: colors.lineColor,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      debugPrint('Ubah Password');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailHistoryMaintenanceActivity()));
                    },
                    title: Text('Lambung Atas Garis Air', style: TextStyle(fontWeight: FontWeight.normal,color: colors.textColor),),
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