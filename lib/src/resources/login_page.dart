import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/src/app.dart';
import 'package:taxi_app/src/resources/dialog/loading_dialog.dart';
import 'package:taxi_app/src/resources/dialog/msg_dialog.dart';
import 'package:taxi_app/src/resources/home_page.dart';
import 'package:taxi_app/src/resources/registration_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Image.asset(
                "images/ic_car_green.png",
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 6),
                child: Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 20, color: Color(0xff333333)),
                ),
              ),
              Text(
                "Login to continue using iCab",
                style: TextStyle(fontSize: 16, color: Color(0xff606470)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Container(
                        width: 50,
                        child: Image.asset("images/ic_mail.png"),
                      ),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                ),
              ),
              TextField(
                style: TextStyle(fontSize: 18, color: Colors.black),
                obscureText: true,
                controller: _passController,
                decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Container(
                      width: 50,
                      child: Image.asset("images/ic_lock.png"),
                    ),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffCED0D2), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
              ),
              Container(
                constraints: BoxConstraints.loose(Size(double.infinity, 30)),
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: RaisedButton(
                    onPressed: _onLoginClicked,
                    child: Text(
                      "Log In",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    color: Color(0xff3277D8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: RichText(
                    text: TextSpan(
                        text: "New user?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff606470),
                        ),
                        children: <TextSpan>[
                      TextSpan(
                          recognizer: new TapGestureRecognizer()..onTap = (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()),);
                          },
//                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()),);
                          text: " Sign up for a new account",
                          style: TextStyle(fontSize: 16, color: Colors.blue))
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onLoginClicked(){

    String email = _emailController.text.trim();
    String pass = _passController.text.trim();

    var authBloc = MyApp.of(context).authBloc;
    LoadingDialog.showLoadingDialog(context, "Loading...");
    authBloc.signIn(email, pass, (){
      LoadingDialog.hideLoadingDialog(context);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
    }, (msg){
      LoadingDialog.hideLoadingDialog(context);
      MsgDialog.showMsgDialog(context, "Sign_In", msg);
    });
  }

  void _onLoginClicked1(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
  }
}
