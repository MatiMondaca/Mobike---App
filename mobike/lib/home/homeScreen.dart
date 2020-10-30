import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobike/loginRegister/login/autenticacion/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget appbar = Text(
    "Home",
    style: TextStyle(
      color: Colors.black,
      fontSize: 25.0,
    ),
    textAlign: TextAlign.center,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      //  AppBar mas iconos
      //
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: appbar,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: IconButton(
            icon: Icon(Icons.person),
            color: Colors.black,
            iconSize: 30.0,
            onPressed: () {},
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(Icons.settings),
              color: Colors.black,
              iconSize: 30.0,
              onPressed: () {},
            ),
          ),
        ],
      ),
      //
      //  Body
      //
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Bienvenido a Mobike",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 15.0,
                ),
                child: Text(
                  "Cerrar Sesión",
                  style: TextStyle(fontSize: 20.0),
                ),
                elevation: 5.0,
                splashColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
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
