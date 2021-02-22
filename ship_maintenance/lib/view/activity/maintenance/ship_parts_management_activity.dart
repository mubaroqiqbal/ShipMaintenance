import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:ship_maintenance/infrastructure/colors.dart';
import 'package:ship_maintenance/view/activity/maintenance/detail_ship_parts_maintenance_activity.dart';
import 'package:ship_maintenance/view/activity/message_activity.dart';

class ShipPartsManagementActivity extends StatefulWidget{

  @override
  _ShipPartsManagementActivity createState() => _ShipPartsManagementActivity();
}

class _ShipPartsManagementActivity extends State<ShipPartsManagementActivity>{
  final _formKey = GlobalKey<FormState>();

  ScrollController _controller;

  int val=0;

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
          title: Text("Kelola Stok", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
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
            ListTile(
              title: Text('Kelola Stok', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              trailing: SizedBox(
                height: 30,
                child: FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    side: BorderSide(color: colors.primaryBlue),
                  ),
                  color: Colors.white,
                  textColor: colors.primaryBlue,
                  onPressed: () {
                    debugPrint("tapped on top up button");
                    dialogTambahSukuCadang();
                  },
                  child: Text(
                    "Tambah",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ),
            _searchTextField(),
            Container(
              margin: EdgeInsets.only(top: 100),
              padding: EdgeInsets.symmetric(vertical: 15),
              child: ListView.builder(
                controller: _controller,
                itemCount: 5,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailShipPartsManagementActivity()));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
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
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Text("Lampu Emergency", style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                            visualDensity: VisualDensity(vertical: -3),
                            dense: true,
                            title: Text("Jumlah Stok Suku Cadang"),
                            trailing: Text("5", style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                            visualDensity: VisualDensity(vertical: -3),
                            dense: true,
                            title: Text("Jumlah Pemakaian"),
                            trailing: Text("2", style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
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

  Widget _searchTextField() {
    return Container(
      margin: EdgeInsets.only(top: 60, left: 20, right: 15),
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

  void dialogTambahSukuCadang(){
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0))
        ),
        builder: (builder) {
          return new StatefulBuilder(
              builder: (context, refresh){
                return Container(
                  height: MediaQuery.of(context).size.height*0.9,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
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
                            title: Text("Tambah Suku Cadang", style: TextStyle(fontWeight: FontWeight.bold),),
                            trailing: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(15, 20, 15, 5),
                          child: Text("Nama Suku Cadang", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          height: 40,
                          child: TextFormField(
                            onEditingComplete: (){

                            },
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              hintText: 'Masukkan nama suku cadang',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(15, 20, 15, 5),
                          child: Text("Jumlah Suku Cadang", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*0.6,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.symmetric(vertical: 5),
                                        child: Text("Jumlah Barang", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),)
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      color: val!=0?colors.primaryBlue : Colors.grey,
                                      onPressed: (){
                                        if(val!=0){
                                          val-=1;
                                        }
                                        refresh(() {});
                                      },
                                    ),
                                    Text(val.toString()),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      color: colors.primaryBlue,
                                      onPressed: (){
                                        val+=1;
                                        refresh(() {});
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        val!=0?
                        Container(
                          margin: EdgeInsets.fromLTRB(15, 20, 15, 5),
                          child: Text("Plat Nomor Suku Cadang", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ) : Container(),
                        Container(
                            child: Column(
                                children: List.generate(val, (index) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.5,
                                          child: Text("Suku Cadang "+(index+1).toString()),
                                        ),
                                        Expanded(
                                            child: Container(
                                              height: 40,
                                              child: TextFormField(
                                                onEditingComplete: (){

                                                },
                                                keyboardType: TextInputType.text,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                                  hintText: 'Masukkan pertanyaan Anda',
                                                  hintStyle: TextStyle(color: Colors.grey),
                                                  border: new OutlineInputBorder(
                                                    borderRadius: new BorderRadius.circular(10.0),
                                                    borderSide: new BorderSide(color: Colors.grey),
                                                  ),
                                                ),
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                  );
                                })
                            )
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(15, 20, 15, 5),
                          child: Text("Dokumen Penerimaan Barang", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(15, 20, 15, 5),
                          width: MediaQuery.of(context).size.width*0.9,
                          height: (MediaQuery.of(context).size.width*0.9)*0.3,
                          color: colors.thirdBlue,
                          child: DottedBorder(
                              color: colors.primaryBlue,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              dashPattern: [5,2],
                              strokeWidth: 1,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.file_upload,
                                      color: colors.primaryBlue,
                                    ),
                                    Text("Upload Dokumen"),
                                    Text("Klik Disini", style: TextStyle(color: colors.primaryBlue, fontSize: 12),),
                                  ],
                                ),
                              )
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                          height: 40,
                          child: RaisedButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            onPressed: () {

                            },
                            child: Text(
                              "Kirim".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            color: colors.primaryBlue,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}