import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:ship_maintenance/infrastructure/colors.dart';
import 'package:ship_maintenance/view/activity/message_activity.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DetailShipMachineMaintenanceActivity extends StatefulWidget{

  @override
  _DetailShipMachineMaintenanceActivity createState() => _DetailShipMachineMaintenanceActivity();
}

class _DetailShipMachineMaintenanceActivity extends State<DetailShipMachineMaintenanceActivity>{
  final _formKey = GlobalKey<FormState>();

  int radioValue=0;

  String currentGender;

  List<DropdownMenuItem<String>> genderDropdownItem;

  @override
  void initState() {
    _dropdownGenderItem();
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
            title: Text("Lambung bawah garis air", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
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
          body: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: ListTile(
                        title: Text("Perawatan dalam"),
                        trailing: Text("500 jam", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      width: media.width*0.9,
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                          right: BorderSide(
                            color: colors.lineColor,
                            width: 0.5,
                          ),
                          left: BorderSide(
                            color: colors.lineColor,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Frekuensi perawatan", style: TextStyle(fontWeight: FontWeight.bold),),
                          Container(
                            decoration: BoxDecoration(
                                color: colors.primaryBlue,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            child: Text("Service per 2500 jam", style: TextStyle(color: Colors.white),),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Text("Perawatan terakhir", style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                            visualDensity: VisualDensity(vertical: -3),
                            dense: true,
                            title: Text("Service per 2500 jam"),
                            trailing: Text("2 Januari 2021", style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Text("Perawatan Selanjutnya", style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                            visualDensity: VisualDensity(vertical: -3),
                            dense: true,
                            title: Text("Service per 2500 jam"),
                            trailing: Text("12 maret 2021", style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      width: media.width,
                      height: 100,
                      child: Row(
                        children: [
                          TimelineTile(
                            indicatorStyle: IndicatorStyle(
                              color: Colors.black,
                            ),
                            afterLineStyle: LineStyle(color: Colors.black),
                            beforeLineStyle: LineStyle(color: Colors.black),
                            axis: TimelineAxis.horizontal,
                            alignment: TimelineAlign.center,
                            endChild: Container(
                              constraints: BoxConstraints(
                                minWidth: media.width/3,
                              ),
                              color: Colors.white,
                              child: Text("15000", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                            ),
                            startChild: Container(
                              color: Colors.white,
                            ),
                          ),
                          TimelineTile(
                            indicatorStyle: IndicatorStyle(
                              color: Colors.black,
                            ),
                            beforeLineStyle: LineStyle(color: Colors.black),
                            afterLineStyle: LineStyle(color: Colors.grey),
                            axis: TimelineAxis.horizontal,
                            alignment: TimelineAlign.center,
                            endChild: Container(
                              constraints: BoxConstraints(
                                minWidth: media.width/3,
                              ),
                              color: Colors.white,
                              child: Text("17500", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                            ),
                            startChild: Container(
                              color: Colors.white,
                            ),
                          ),
                          TimelineTile(
                            indicatorStyle: IndicatorStyle(
                              color: Colors.grey,
                            ),
                            beforeLineStyle: LineStyle(color: Colors.grey),
                            afterLineStyle: LineStyle(color: Colors.grey),
                            axis: TimelineAxis.horizontal,
                            alignment: TimelineAlign.center,
                            endChild: Container(
                              constraints: BoxConstraints(
                                minWidth: media.width/3,
                              ),
                              color: Colors.white,
                              child: Text("20000", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                            ),
                            startChild: Container(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, right: 20, left: 20),
                      child: Text("Perawatan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: _buildTextFieldType(),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25, right: 20, left: 20),
                      child: Text("Jenis perawatan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10
                          ),
                          decoration: BoxDecoration(
                              color: colors.primaryBlue,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          child: Text("Service", style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text("Input Kondisi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      trailing: Container(
                        decoration: BoxDecoration(
                            color: colors.primaryBlue,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Text("Sangat Baik", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: media.width/5,
                          child: Column(
                            children: [
                              new Radio(
                                value: 1,
                                groupValue: radioValue,
                                onChanged: ((value){
                                  debugPrint(value.toString());
                                  debugPrint("SKN = "+value.toString());
                                  setState(() {
                                    radioValue=value;
                                  });
                                }),
                              ),
                              Text("1")
                            ],
                          ),
                        ),
                        Container(
                          width: media.width/5,
                          child: Column(
                            children: [
                              new Radio(
                                value: 2,
                                groupValue: radioValue,
                                onChanged: ((value){
                                  debugPrint(value.toString());
                                  debugPrint("SKN = "+value.toString());
                                  setState(() {
                                    radioValue=value;
                                  });
                                }),
                              ),
                              Text("2")
                            ],
                          ),
                        ),
                        Container(
                          width: media.width/5,
                          child: Column(
                            children: [
                              new Radio(
                                value: 3,
                                groupValue: radioValue,
                                onChanged: ((value){
                                  debugPrint(value.toString());
                                  debugPrint("SKN = "+value.toString());
                                  setState(() {
                                    radioValue=value;
                                  });
                                }),
                              ),
                              Text("3")
                            ],
                          ),
                        ),
                        Container(
                          width: media.width/5,
                          child: Column(
                            children: [
                              new Radio(
                                value: 4,
                                groupValue: radioValue,
                                onChanged: ((value){
                                  debugPrint(value.toString());
                                  debugPrint("SKN = "+value.toString());
                                  setState(() {
                                    radioValue=value;
                                  });
                                }),
                              ),
                              Text("4")
                            ],
                          ),
                        ),
                        Container(
                          width: media.width/5,
                          child: Column(
                            children: [
                              new Radio(
                                value: 5,
                                groupValue: radioValue,
                                onChanged: ((value){
                                  debugPrint(value.toString());
                                  debugPrint("SKN = "+value.toString());
                                  setState(() {
                                    radioValue=value;
                                  });
                                }),
                              ),
                              Text("5")
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25, right: 20, left: 20),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      height: (media.width*0.9)*0.5,
                      width: media.width*0.9,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      height: 50,
                      width: media.width*0.89,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          side: BorderSide(color: colors.primaryBlue),
                        ),
                        color: Colors.white,
                        textColor: colors.primaryBlue,
                        onPressed: () {
                          debugPrint("tapped on Ambil Gambar button");
                        },
                        child: Text(
                          "Ambil Gambar".toUpperCase(),
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 10),
                      child: Text("Feedback", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    ),
                    _feedbackTextField(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                      height: 50,
                      width: media.width*0.89,
                      child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                        color: colors.primaryBlue,
                        elevation: 0,
                        onPressed: () {
                          final form = _formKey.currentState;
                          form.save();

                          Navigator.of(context).pushReplacementNamed('/home');
                        },
                        child: Text(
                          "masuk".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          )
      ),
    );
  }

  Widget _feedbackTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: TextField(
        maxLines: 4,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Colors.black12
        ),
      ),
    );
  }

  Widget _buildTextFieldType() {
    return new DropdownButton(
      underline: Container(
        height: 1,
        color: colors.textColor,
      ),
      hint: Text('Pilih salah satu'),
      value: currentGender,
      items: genderDropdownItem,
      isExpanded: true,
      onChanged: ((value){
        setState(() {
          currentGender = value;
        });
      }),
    );
  }

  void _dropdownGenderItem() {

    genderDropdownItem = new List();

    genderDropdownItem.clear();

    genderDropdownItem.add(new DropdownMenuItem(
        value: '2500',
        child: new Text('2500 Jam')
    ));
    genderDropdownItem.add(new DropdownMenuItem(
        value: '5000',
        child: new Text('5000 Jam')
    ));


    setState(() {});

  }
}