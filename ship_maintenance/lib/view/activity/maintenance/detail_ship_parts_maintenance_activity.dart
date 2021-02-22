import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:ship_maintenance/infrastructure/colors.dart';
import 'package:ship_maintenance/view/activity/guideline/guideline_book.dart';
import 'package:ship_maintenance/view/activity/guideline/guideline_video.dart';
import 'package:ship_maintenance/view/activity/maintenance/management/stock_being_use_activity.dart';
import 'package:ship_maintenance/view/activity/maintenance/management/stock_list_activity.dart';
import 'package:ship_maintenance/view/activity/message_activity.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';

class DetailShipPartsManagementActivity extends StatefulWidget {

  static TabController controller;

  @override
  _DetailShipPartsManagementActivity createState() => _DetailShipPartsManagementActivity();
}

class _DetailShipPartsManagementActivity extends State<DetailShipPartsManagementActivity> with SingleTickerProviderStateMixin {

  int val=0;

  @override
  void initState(){
    DetailShipPartsManagementActivity.controller = new TabController(vsync: this, length: 2);

    super.initState();
  }

  @override
  void dispose(){
    DetailShipPartsManagementActivity.controller.dispose();
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
        title: Text("Lampu Emergency", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              dense: true,
              title: Text("Jumlah Stok Suku Cadang", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              trailing: Text("15", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            ListTile(
              dense: true,
              title: Text("Jumlah Terpakai", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              trailing: Text("5", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  height: 30,
                  width: (media.width*0.5)-20,
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      side: BorderSide(color: colors.primaryBlue),
                    ),
                    color: Colors.white,
                    textColor: colors.primaryBlue,
                    onPressed: () {
                      debugPrint("tapped on Ambil Gambar button");
                      dialogTambahStokSukuCadang();
                    },
                    child: Text(
                      "Tambah Stok".toUpperCase(),
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  height: 30,
                  width: (media.width*0.5)-20,
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      side: BorderSide(color: colors.primaryRed),
                    ),
                    color: Colors.white,
                    textColor: colors.primaryRed,
                    onPressed: () {
                      debugPrint("tapped on Ambil Gambar button");
                      dialogRequestBarang();
                    },
                    child: Text(
                      "Request Barang".toUpperCase(),
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: media.height*0.1,
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
              child: new TabBar(
                onTap: ((value){
                  setState(() {
                    DetailShipPartsManagementActivity.controller.index = value;
                  });
                }),
                controller: DetailShipPartsManagementActivity.controller,
                labelColor: colors.textColor,
                //source code lanjutan
                tabs: <Widget>[
                  new Tab(
                    text: "Daftar Stok",
                  ),
                  new Tab(
                    text: "Daftar Pemakaian",
                  ),
                ],
              ),
            ),
            Container(
              height: media.height*0.6,
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
              child: new TabBarView(
                //controller untuk tab bar
                controller: DetailShipPartsManagementActivity.controller,
                children: <Widget>[
                  new StockListActivity(),
                  new StockBeingUseActivity()
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  void dialogRequestBarang(){
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0))
        ),
        builder: (builder) {
          return new StatefulBuilder(
              builder: (context, refresh){
                return Container(
                  height: 260,
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
                          title: Text("Request Barang", style: TextStyle(fontWeight: FontWeight.bold),),
                          trailing: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: Text("Lampu Emergency", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
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
                                      child: Text("Request Suku Cadang", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),)
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
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Text("Jumlah suku cadang yang diminta", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),),
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
                );
              });
        });
  }

  void dialogTambahStokSukuCadang(){
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
                            title: Text("Tambah Stok Suku Cadang", style: TextStyle(fontWeight: FontWeight.bold),),
                            trailing: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          child: Text("Lampu Emergency", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
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
                                        child: Text("Pemasukkan Suku Cadang", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),)
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
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Text("Total suku cadang yang baru masuk", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(15, 20, 15, 5),
                          child: Text("Plat Nomor Suku Cadang", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
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