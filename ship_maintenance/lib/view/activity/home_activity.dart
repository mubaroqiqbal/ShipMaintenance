import 'package:flutter/material.dart';
import 'package:ship_maintenance/infrastructure/colors.dart';
import 'package:ship_maintenance/view/activity/history_activity.dart';
import 'package:ship_maintenance/view/activity/login_activity.dart';
import 'package:ship_maintenance/view/activity/maintenance_activity.dart';
import 'package:ship_maintenance/view/activity/profile_activity.dart';

class HomeActivity extends StatefulWidget {

  static String lenderStatus;
  static String borrowerStatus;

  @override
  _HomeActivity createState() => _HomeActivity();
}

class _HomeActivity extends State<HomeActivity> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    //timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.of(context).size;

    Future<bool> _onWillPop() {
      return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Keluar'),
          content: new Text('Apakah Anda yakin ingin keluar?'),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('Tidak'),
            ),
            new FlatButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (BuildContext context) => LoginActivity()),
                ModalRoute.withName('/'),
              ),
              child: new Text('Ya'),
            ),
          ],
        ),
      ) ?? false;
    }


    return new WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
            children: [
              Container(
                height: media.height-60,
                child: new TabBarView(
                  //controller untuk tab bar
                  controller: controller,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    new MaintenanceActivity(),
                    new HistoryActivity(),
                    new ProfileActivity()
                  ],
                ),
              ),
            ]
        ),
        floatingActionButton: Container(
          height: media.width <= 360 || media.width <= 400 ? 65 : 75,
          width: media.width <= 360 || media.width <= 400? 65 : 75,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(Radius.circular(45)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: FloatingActionButton(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 0,
            backgroundColor: Colors.green,
            child: Container(
              height: 35,
              child: Image.asset("images/whatsapp-logo.png"),
            ),
            onPressed: () {
              debugPrint("tapped on floating");
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.only(bottom: 5),
          child: TabBar(
            controller: controller,
            labelColor: colors.primaryBlue,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: colors.textColor,
            labelPadding: EdgeInsets.all(10),
            onTap: (index){

            },
            tabs: <Widget>[
              new Tab(
                child: Column(
                  children: [
                    Icon(
                      Icons.build,
                      size: 26,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Perawatan", style: TextStyle(fontSize: 12),)
                  ],
                ),
              ),
              new Tab(
                child: Column(
                  children: [
                    Icon(
                      Icons.history,
                      size: 26,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("History", style: TextStyle(fontSize: 12),)
                  ],
                ),
              ),
              new Tab(
                child: Column(
                  children: [
                    Icon(
                      Icons.person,
                      size: 26,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Profil", style: TextStyle(fontSize: 12),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}