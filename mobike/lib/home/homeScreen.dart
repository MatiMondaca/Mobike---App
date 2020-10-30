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
              Padding(padding: EdgeInsets.all(80.0), child:
              Text("Bienvenido",style:  TextStyle(fontSize: 50.0,fontWeight: FontWeight.normal))),
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
