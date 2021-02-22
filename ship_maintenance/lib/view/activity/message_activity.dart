import 'package:flutter/material.dart';
import 'package:ship_maintenance/infrastructure/colors.dart';

class MessageActivity extends StatefulWidget {

  @override
  _MessageActivity createState() => _MessageActivity();

}

class _MessageActivity extends State<MessageActivity>{

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
          child: Text("Pesan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
        ),
        backgroundColor: colors.primaryBlue,
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            child: ListView.builder(
              itemCount: 5,
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
                    },
                    title: Text('Tolong segera lakukan pengecekan kapal', style: TextStyle(fontWeight: FontWeight.normal,color: colors.textColor),),
                    trailing: Text("12:13"),
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