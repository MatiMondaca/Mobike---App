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
          body: SafeArea(
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  context.read<AutenticacionServicio>().signOut();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}