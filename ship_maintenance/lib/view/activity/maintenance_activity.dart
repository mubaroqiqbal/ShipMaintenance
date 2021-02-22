import 'package:flutter/material.dart';
import 'package:ship_maintenance/infrastructure/colors.dart';
import 'package:ship_maintenance/view/activity/guideline_activity.dart';
import 'package:ship_maintenance/view/activity/maintenance/ships_machine_maintenance_activity.dart';
import 'package:ship_maintenance/view/activity/message_activity.dart';
import 'package:ship_maintenance/view/activity/maintenance/ship_maintenance_activity.dart';
import 'package:ship_maintenance/view/activity/maintenance/ship_parts_management_activity.dart';
import 'package:ship_maintenance/view/activity/reminder_list_activity.dart';

class MaintenanceActivity extends StatefulWidget {

  @override
  _MaintenanceActivity createState() => _MaintenanceActivity();

}

class _MaintenanceActivity extends State<MaintenanceActivity>{

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
            child: Text("Perawatan Kapal", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
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
          bottom: PreferredSize(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReminderListActivity()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: media.width,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colors.primaryRed,
                    border: Border(
                      top: BorderSide(
                        color: colors.primaryRed,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(Icons.warning, color: Colors.white,),
                      ),
                      Expanded(
                        child: Text('Jendela Kedap', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text("terlambat 10 menit", style: TextStyle(color: Colors.white, fontSize: 14),),
                        ),
                      ),
                    ],
                  )
                ),
              ),
              preferredSize: Size.fromHeight(40.0)
          ),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ListTile(
              title: Text('Tugas Anda', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              trailing: SizedBox(
                height: 35,
                child: FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    side: BorderSide(color: colors.primaryBlue),
                  ),
                  color: Colors.white,
                  textColor: colors.primaryBlue,
                  onPressed: () {
                    debugPrint("tapped on top up button");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GuidelineActivity()));
                  },
                  child: Text(
                    "Lihat Panduan",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 35),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: ListView.builder(
                itemCount: 3,
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
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text("Kapal A", style: TextStyle(fontWeight: FontWeight.bold)),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(index==0? "Lambung Kapal dan Bangunan Kapal": index==1? "Mesin Induk" : "Mengelola stok barang dan gudang"),
                              ),
                              Container(
                                height: 40,
                                margin: EdgeInsets.only(top: 15),
                                child: RaisedButton(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(5.0),
                                  ),
                                  elevation: 0,
                                  child: Text(index!=2? 'Lakukan Perawatan'.toUpperCase() : "Kelola Suku Cadang".toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  onPressed: (){
                                    if(index==0){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ShipMaintenanceActivity()));
                                    }else if(index==2){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ShipPartsManagementActivity()));
                                    }else{
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ShipsMachineMaintenanceActivity()));
                                    }
                                  },
                                  color: colors.primaryBlue,
                                ),
                              )
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