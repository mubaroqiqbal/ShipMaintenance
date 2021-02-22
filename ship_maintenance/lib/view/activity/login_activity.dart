import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ship_maintenance/infrastructure/colors.dart';
import 'package:ship_maintenance/infrastructure/my_connectivity.dart';

class LoginActivity extends StatefulWidget {
  @override
  _LoginActivity createState() => _LoginActivity();
}

class _LoginActivity extends State<LoginActivity>{
  final _formKey = GlobalKey<FormState>();
  final _formKeyModal = GlobalKey<FormState>();

  Map _source = {ConnectivityResult.none: false};
  MyConnectivity _connectivity = MyConnectivity.instance;

  String _password;
  String _username;
  bool _obscureText=true;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

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
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Ya'),
          ),
        ],
      ),
    ) ?? false;
  }

  @override
  Widget build(BuildContext context){
    var media = MediaQuery.of(context).size;

    return new WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 75,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Image.asset(
                    'images/logo.jpg',
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text('Kementerian Kelautan dan Perikanan', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      //border: Border.all(color: colors.greyTextColor),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            child: Text('LOGIN', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                child: Text('Username'),
                              )
                            ],
                          ),
                          _buildTextFieldUsername(),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                child: Text('Password'),
                              )
                            ],
                          ),
                          _buildTextFieldPassword(),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 50,
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
                ),
              ],
            ),
        )
    );
  }

  Widget _buildTextFieldPassword() {
    return TextFormField(
      onSaved: (value) => _password = value,
      obscureText: _obscureText,
      decoration: InputDecoration(
          suffixIcon: new GestureDetector(
            child: Icon(_obscureText==true ? Icons.visibility_off : Icons.visibility),
            onTap: (){
              setState(() {
                if(_obscureText==true){
                  _obscureText=false;
                }else{
                  _obscureText=true;
                }
              });
            },
          ),
      ),
    );
  }

  Widget _buildTextFieldUsername() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => _username = value,
      decoration: InputDecoration(
          suffixIcon: Icon(Icons.account_circle)
      ),
    );
  }
}