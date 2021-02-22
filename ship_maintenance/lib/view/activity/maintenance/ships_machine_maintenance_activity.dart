import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:ship_maintenance/infrastructure/colors.dart';
import 'package:ship_maintenance/view/activity/maintenance/detail_ship_machine_maintenance_activity.dart';
import 'package:ship_maintenance/view/activity/maintenance/detail_ship_maintenance_activity.dart';
import 'package:ship_maintenance/view/activity/message_activity.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class ShipsMachineMaintenanceActivity extends StatefulWidget{

  @override
  _ShipsMachineMaintenanceActivity createState() => _ShipsMachineMaintenanceActivity();
}

class _ShipsMachineMaintenanceActivity extends State<ShipsMachineMaintenanceActivity>{
  final _formKey = GlobalKey<FormState>();
  String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  String _setTime, _setDate;

  String _hour, _minute, _time;

  ScrollController _controller;

  TextEditingController _dateFromController = TextEditingController();
  TextEditingController _dateTillController = TextEditingController();
  TextEditingController _timeFromController = TextEditingController();
  TextEditingController _timeTillController = TextEditingController();

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

    Widget _dateFromTextField() {
      return GestureDetector(
        onTap: (){
          _selectFromDate(context).then((value) {
            setState(() {});
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          height: 30,
          width: media.width*0.3,
          child: TextFormField(
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.text,
            enabled: false,
            controller: _dateFromController,
            decoration: new InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey)
              ),
            ),
            onSaved: (String val) {

            },
          ),
        ),
      );
    }

    Widget _dateTillTextField() {
      return GestureDetector(
        onTap: (){
          _selectTillDate(context).then((value) {
            setState(() {});
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          height: 30,
          width: media.width*0.3,
          child: TextFormField(
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.text,
            enabled: false,
            controller: _dateTillController,
            decoration: new InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey)
              ),
            ),
            onSaved: (String val) {

            },
          ),
        ),
      );
    }

    Widget _timeFromTextField() {
      return GestureDetector(
        onTap: (){
          _selectFromTime(context).then((value) {
            setState(() {});
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          height: 30,
          width: media.width*0.2,
          child: TextFormField(
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            onSaved: (String val) {
              _setTime = val;
            },
            enabled: false,
            keyboardType: TextInputType.text,
            controller: _timeFromController,
            decoration: new InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey)
              ),
            ),
          ),
        ),
      );
    }

    Widget _timeTillTextField() {
      return GestureDetector(
        onTap: (){
          _selectTillTime(context).then((value) {
            setState(() {});
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          height: 30,
          width: media.width*0.2,
          child: TextFormField(
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            onSaved: (String val) {
              _setTime = val;
            },
            enabled: false,
            keyboardType: TextInputType.text,
            controller: _timeTillController,
            decoration: new InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey)
              ),
            ),
          ),
        ),
      );
    }
    
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0.0,
          titleSpacing: 0.0,
          title: Text("Mesin Induk", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Lama Mesin Menyala", style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Text("2 Jam", style: TextStyle(fontWeight: FontWeight.bold, color: colors.primaryBlue)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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
                        left: BorderSide(
                          color: colors.lineColor,
                          width: 0.5,
                        ),
                        right: BorderSide(
                          color: colors.lineColor,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          dense: true,
                          title: Text("Dari", style: TextStyle(fontWeight: FontWeight.bold),),
                          trailing: Container(
                            width: media.width*0.55,
                            child: Row(
                              children: [
                                _timeFromTextField(),
                                SizedBox(
                                  width: 5,
                                ),
                                _dateFromTextField()
                              ],
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text("Sampai", style: TextStyle(fontWeight: FontWeight.bold),),
                          trailing: Container(
                            width: media.width*0.55,
                            child: Row(
                              children: [
                                _timeTillTextField(),
                                SizedBox(
                                  width: 5,
                                ),
                                _dateTillTextField()
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: media.width*0.8,
                          margin: EdgeInsets.only(top: 10, bottom: 15),
                          child: RaisedButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            elevation: 0,
                            child: Text("submit".toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            onPressed: (){

                            },
                            color: colors.primaryBlue,
                          ),
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 230, left: 15, right: 15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _searchTextField(),
                    ],
                  ),
                )
            ),
            Container(
              margin: EdgeInsets.only(top: 280),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                controller: _controller,
                itemCount: 5,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailShipMachineMaintenanceActivity()));
                    },
                    child: Container(
                        padding: EdgeInsets.all(15),
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
                        child: Text('Mesin Induk', style: TextStyle(fontWeight: FontWeight.normal,color: colors.textColor),)
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> _selectFromDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime.now()
    );
    if (picked != null)
      debugPrint(DateFormat('dd MMM yyyy', "id_ID").format(picked));
      selectedDate = picked;
      _dateFromController.text = DateFormat('dd MMM yyyy', "id_ID").format(selectedDate);
      setState(() { });
  }

  Future<Null> _selectTillDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime.now()
    );
    if (picked != null)
      debugPrint(DateFormat('dd MMM yyyy', "id_ID").format(picked));
      selectedDate = picked;
      _dateTillController.text = DateFormat('dd MMM yyyy', "id_ID").format(selectedDate);
      setState(() { });
  }


  Future<Null> _selectFromTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeFromController.text = _time;
        _timeFromController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [HH, ':', nn]).toString();
      });
  }
  
  Future<Null> _selectTillTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeTillController.text = _time;
        _timeTillController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [HH, ':', nn]).toString();
      });
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