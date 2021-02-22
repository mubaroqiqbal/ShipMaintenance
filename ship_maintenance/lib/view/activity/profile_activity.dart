import 'package:flutter/material.dart';
import 'package:ship_maintenance/infrastructure/colors.dart';
import 'package:ship_maintenance/view/activity/change_password_activity.dart';
import 'package:ship_maintenance/view/activity/login_activity.dart';
import 'package:ship_maintenance/view/activity/message_activity.dart';

class ProfileActivity extends StatefulWidget {

  @override
  _ProfileActivity createState() => _ProfileActivity();

}

class _ProfileActivity extends State<ProfileActivity>{

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
            child: Text("Profil", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
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
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: ListTile(
                            title: Text('Nama Lengkap', style: TextStyle(fontWeight: FontWeight.bold,color: colors.textColor),),
                            trailing: Text('Jalaludin', style: TextStyle(fontWeight: FontWeight.bold,color: colors.textColor),),
                          ),
                        ),
                        Container(
                          child: ListTile(
                            title: Text('Username', style: TextStyle(fontWeight: FontWeight.bold,color: colors.textColor),),
                            trailing: Text('Jalaludin123', style: TextStyle(fontWeight: FontWeight.bold,color: colors.textColor),),
                          ),
                        ),
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
                            onTap: () {
                              debugPrint('Ubah Password');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordActivity()));
                            },
                            title: Text('Ubah Password', style: TextStyle(fontWeight: FontWeight.bold,color: colors.primaryBlue),),
                            trailing: Icon(Icons.arrow_forward_ios, color: colors.primaryBlue,),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.white,
                          child: ListTile(
                            onTap: () {
                              debugPrint('Log Out');
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginActivity()));
                            },
                            title: Center(
                              child: Text('Log Out', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]
        )
    );
  }
}