import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobike/loginRegister/login/autenticacion/auth.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Scaffold(
          body: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                        onPressed: null,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Text("Opción uno", textAlign: TextAlign.center,)),
                  ),
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}