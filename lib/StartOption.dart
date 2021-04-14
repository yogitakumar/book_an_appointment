import 'package:book_an_appointment/RegistrationPage.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';

class StartOption extends StatefulWidget {
  @override
  _StartOptionState createState() => _StartOptionState();
}

class _StartOptionState extends State<StartOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Text(
                "Let's Talk",
                style: TextStyle(
                    fontFamily: "Knewave",
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                child: new MaterialButton(
                  elevation: 5.0,
                  minWidth: 350.0,
                  height: 42.0,
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                child: new MaterialButton(
                  elevation: 5.0,
                  minWidth: 350.0,
                  height: 42.0,
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>RegistrationPage()));
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 20),
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
