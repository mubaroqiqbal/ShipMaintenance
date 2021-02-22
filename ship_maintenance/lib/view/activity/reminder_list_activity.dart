import 'package:flutter/material.dart';
import 'package:ship_maintenance/infrastructure/colors.dart';
import 'package:ship_maintenance/view/activity/history/detail_history_maintenance_activity.dart';
import 'package:ship_maintenance/view/activity/maintenance/detail_ship_maintenance_activity.dart';
import 'package:ship_maintenance/view/activity/message_activity.dart';

class ReminderListActivity extends StatefulWidget {

  @override
  _ReminderListActivity createState() => _ReminderListActivity();

}

class _ReminderListActivity extends State<ReminderListActivity>{

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
          child: Text("Reminder", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
        ),
        leading: IconButton(icon:Icon(Icons.arrow_back_ios),
          onPressed:() => Navigator.pop(context),
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
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: colors.primaryRed,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      debugPrint('Ubah Password');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailShipMaintenanceActivity()));
                    },
                    title: Text('Lambung Atas Garis Air', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                    trailing: Text('Terlambar 10 Jam', style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white),),
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