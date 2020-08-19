import 'dart:io';

import 'package:erp/util/preferences/preferences.dart';
import 'package:erp/view/reg_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import '../db/dao/person_dao.dart';
import 'package:erp/view/home_page.dart';
import 'package:erp/util/toast.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  final PersonDao personDao;

  const LoginPage({Key key, @required this.personDao}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState(personDao);
}

class _LoginPageState extends State<LoginPage> {
  final PersonDao personDao;

  _LoginPageState(this.personDao);

  var unTxt = TextEditingController();
  var pwTxt = TextEditingController();

  var unFocus = FocusNode();
  var pwFocus = FocusNode();
  var logBtnFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  void validate() {
    if (unTxt.text.isEmpty) {
      toastWarnning("Please Enter Username");
      return;
    }
    if (pwTxt.text.isEmpty) {
      toastWarnning("Please Enter Password");
      return;
    }

    if (unTxt.text.length > 0 && pwTxt.text.length > 0) {
      personDao.findPersonByUnPw(unTxt.text, pwTxt.text).then((value) {
        if (value != null) {
          Prefs.setUsername(unTxt.text);
          Prefs.setPassword(pwTxt.text);
          toastSuccess("Hello, " + value.un);
          Navigator.of(context).pushNamed("Home");
        } else {
          toastDanger("Login Falid");
        }
      });
    }
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      focusNode: unFocus,
//      autofocus: true,
      controller: unTxt,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, unFocus, pwFocus);
      },
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
//      autofocus: true,
      focusNode: pwFocus,
      obscureText: true,
      controller: pwTxt,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, pwFocus, logBtnFocus);
      },
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        focusNode: logBtnFocus,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          validate();
//          Navigator.of(context).pushNamed(HomePage.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );
    final forgotLabel2 = FlatButton(
      child: Text(
        'Sign up',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(RegPage.tag, arguments: {"": ""});
      },
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: WillPopScope(
            child: Center(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                children: <Widget>[
                  logo,
                  SizedBox(height: 48.0),
                  email,
                  SizedBox(height: 8.0),
                  password,
                  SizedBox(height: 24.0),
                  loginButton,
                  Row(
                    children: <Widget>[
                      forgotLabel,
                      forgotLabel2,
                    ],
                  ),
                ],
              ),
            ),
            onWillPop: () {
              exit(0);
            }));
  }
}
