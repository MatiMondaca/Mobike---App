import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobike/loginRegister/login/autenticacion/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text("Bienvenido"),
              RaisedButton(
                onPressed: () {
                  context.read<AutenticacionServicio>().signOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
