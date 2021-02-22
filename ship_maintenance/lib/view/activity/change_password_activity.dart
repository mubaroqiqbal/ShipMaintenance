import 'package:flutter/material.dart';
import 'package:ship_maintenance/infrastructure/colors.dart';

class ChangePasswordActivity extends StatefulWidget{

  @override
  _ChangePasswordActivity createState() => _ChangePasswordActivity();
}

class _ChangePasswordActivity extends State<ChangePasswordActivity>{
  final _formKey = GlobalKey<FormState>();

  bool run = true;
  bool _obscureText=true;
  bool _obscureTextNew=true;
  bool _obscureTextConfirmNew=true;

  String _oldPassword;
  String _newPassword;
  String _confirmNewPassword;

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

    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0.0,
          titleSpacing: 0.0,
          title: Text("Ubah Password", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
          backgroundColor: colors.primaryBlue,
          iconTheme: new IconThemeData(color: Colors.white),
          leading: IconButton(icon:Icon(Icons.arrow_back_ios),
            onPressed:() => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.chat_bubble, color: Colors.white,),
              onPressed: (){

              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: Text('Password Saat Ini', style: TextStyle(color: colors.textColor, fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text('Untuk keamanan akun, silakan verifikasi identitas dengan memasukkan password saat ini', style: TextStyle(color: colors.textColor),),
                        ),
                        _buildTextFieldOldPassword(),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              child: Text('Password Baru', style: TextStyle(color: colors.textColor, fontWeight: FontWeight.bold),),
                            )
                          ],
                        ),
                        _buildTextFieldNewPassword(),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              child: Text('Konfirmasi Password Baru', style: TextStyle(color: colors.textColor, fontWeight: FontWeight.bold),),
                            )
                          ],
                        ),
                        _buildTextFieldConfirmNewPassword(),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 50,
                          child: RaisedButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            onPressed: () {
                              final form = _formKey.currentState;
                              form.save();

                            },
                            child: Text(
                              "simpan".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            color: colors.primaryBlue,
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldOldPassword() {
    return TextFormField(
      onSaved: (value) => _oldPassword = value,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: 'Masukkan password saat ini',
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

  Widget _buildTextFieldNewPassword() {
    return TextFormField(
      obscureText: _obscureTextNew,
      onSaved: (value) => _newPassword = value,
      decoration: InputDecoration(
        hintText: 'Masukkan password baru',
        suffixIcon: new GestureDetector(
          child: Icon(_obscureTextNew==true ? Icons.visibility_off : Icons.visibility),
          onTap: (){
            setState(() {
              if(_obscureTextNew==true){
                _obscureTextNew=false;
              }else{
                _obscureTextNew=true;
              }
            });
          },
        ),
      ),
    );
  }

  Widget _buildTextFieldConfirmNewPassword() {
    return TextFormField(
      obscureText: _obscureTextConfirmNew,
      onSaved: (value) => _confirmNewPassword = value,
      decoration: InputDecoration(
        hintText: 'Konfirmasi password baru',
        suffixIcon: new GestureDetector(
          child: Icon(_obscureTextConfirmNew==true ? Icons.visibility_off : Icons.visibility),
          onTap: (){
            setState(() {
              if(_obscureTextConfirmNew==true){
                _obscureTextConfirmNew=false;
              }else{
                _obscureTextConfirmNew=true;
              }
            });
          },
        ),
      ),
    );
  }
}