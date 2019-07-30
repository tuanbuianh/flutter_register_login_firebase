import 'package:flutter/material.dart';
import 'package:taxi_app/src/blocs/auth_bloc.dart';
import 'package:taxi_app/src/resources/dialog/loading_dialog.dart';
import 'package:taxi_app/src/resources/dialog/msg_dialog.dart';
import 'package:taxi_app/src/resources/home_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  AuthBloc authBloc = new AuthBloc();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        title: Text(
//          "Register Account",
//          style: TextStyle(fontSize: 20, color: Colors.red),
//        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
//        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Image.asset("images/ic_car_red.png"),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  "Welcome Aboard!",
                  style: TextStyle(fontSize: 22, color: Color(0xff333333)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 30),
                child: Text(
                  "Sign up with Icab in simple steps",
                  style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                ),
              ),
              StreamBuilder<Object>(
                  stream: authBloc.nameStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          labelText: "Name",
                          errorText: snapshot.hasError ? snapshot.error : null,
                          prefixIcon: Container(
                            width: 50,
                            child: Image.asset("images/ic_user.png"),
                          ),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xffCEDD2), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)))),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: StreamBuilder<Object>(
                    stream: authBloc.phoneStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                            labelText: "Phone Number",
                            errorText:
                                snapshot.hasError ? snapshot.error : null,
                            prefixIcon: Container(
                              width: 50,
                              child: Image.asset("images/ic_phone.png"),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffCEDD2), width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)))),
                      );
                    }),
              ),
              StreamBuilder<Object>(
                  stream: authBloc.emailStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: "Email",
                          errorText: snapshot.hasError ? snapshot.error : null,
                          prefixIcon: Container(
                            width: 50,
                            child: Image.asset("images/ic_mail.png"),
                          ),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xffCEDD2), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)))),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: StreamBuilder<Object>(
                    stream: authBloc.passStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _passController,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password",
                            errorText:
                                snapshot.hasError ? snapshot.error : null,
                            prefixIcon: Container(
                              width: 50,
                              child: Image.asset("images/ic_lock.png"),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffCEDD2), width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)))),
                      );
                    }),
              ),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: RaisedButton(
                  onPressed:
                    _onSignUpClicked,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: RichText(
                    text: TextSpan(
                        text: "Already a User?",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff606470)),
                        children: <TextSpan>[
                      TextSpan(
                          text: " Login now",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff3277D8)))
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onSignUpClicked() {
    var isValid = authBloc.isValid(_nameController.text, _emailController.text,
        _passController.text, _phoneController.text);
    if (isValid) {
      //loading dialog
      LoadingDialog.showLoadingDialog(context, 'Loading...');

      //create user
      authBloc.signUp(_emailController.text.trim(), _passController.text.trim(),
          _phoneController.text.trim(), _nameController.text.trim(), () {
        LoadingDialog.hideLoadingDialog(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      },(msg){
        //show msg dialog
            LoadingDialog.hideLoadingDialog(context);
            MsgDialog.showMsgDialog(context, "Sign-In", msg);
          });
    }
  }
}
