import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:ship_maintenance/infrastructure/colors.dart';
import 'package:ship_maintenance/view/activity/maintenance/detail_ship_maintenance_activity.dart';
import 'package:ship_maintenance/view/activity/message_activity.dart';

class ShipMaintenanceActivity extends StatefulWidget{

  @override
  _ShipMaintenanceActivity createState() => _ShipMaintenanceActivity();
}

class _ShipMaintenanceActivity extends State<ShipMaintenanceActivity>{
  final _formKey = GlobalKey<FormState>();

  ScrollController _controller;

  bool run = true;

  @override
  void initState() {

    super.initState();
  }

  Future<bool> _onWillPop() {
    Navigator.pop(context);
    return null;
  }

  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.of(context).size;

    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0.0,
          titleSpacing: 0.0,
          title: Text("Lambung Kapal dan Bangunan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
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
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text('Lambung Kapal dan Bangunan', style: TextStyle(color: colors.textColor, fontWeight: FontWeight.bold),),
                      ),
                      _searchTextField(),
                    ],
                  ),
                )
            ),
            Container(
              margin: EdgeInsets.only(top: 90),
              padding: EdgeInsets.symmetric(vertical: 15),
              child: ListView.builder(
                controller: _controller,
                itemCount: 5,
                itemBuilder: (context, index){
                  return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: colors.lineColor,
                            width: 0.5,
                          ),
                          bottom: BorderSide(
                            color: colors.lineColor,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              debugPrint("Lambung atas garis air");
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailShipMaintenanceActivity()));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
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
                              child: Container(
                                width: media.width,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Lambung".toUpperCase(),
                                  style: TextStyle(color: colors.textColor, fontWeight: FontWeight.w700, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: List.generate(3, (index) {
                                return GestureDetector(
                                  onTap: (){
                                    debugPrint("Lambung atas garis air");
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailShipMaintenanceActivity()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
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
                                    child: Container(
                                      width: media.width,
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: media.width*0.8,
                                            child: Text('Lambung atas garis air', style: TextStyle(color: colors.textColor)),
                                          ),
                                          Expanded(
                                            child: Icon(
                                              Icons.lens,
                                              color: colors.primaryRed,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          )
                        ],
                      )
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _searchTextField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black12,
      ),
      height: 45,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          fillColor: Colors.black12
        ),
      ),
    );
  }
}