import 'package:flutter/material.dart';
import 'package:mobike/Controllers/controladorFirebase.dart';
import 'package:mobike/loginRegister/login/loginScreen.dart';

import '../../localizador.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ControladorFirebase _authCon = locator.get<ControladorFirebase>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('MoBike'),
          ),
          body: Container(
            padding: EdgeInsets.only(top: 25),
            child: Center(
              child: Column(
                children: <Widget>[
                  buildOpcBusqueda(),
                  buildInfoApp(),
                  buildCerrarSesion(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///
  /// METODOS - VALIDACIONES
  ///

  ///Boton InfoApp
  Padding buildInfoApp() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        onPressed: () {},
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: Colors.black)),
        child: SizedBox(
          width: 250,
          height: 150,
          child: Center(
            child: Text(
              "Información de la aplicación",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  ///Boton Opciones de busqueda
  Padding buildOpcBusqueda() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        onPressed: () {},
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: Colors.black)),
        child: SizedBox(
          width: 250,
          height: 150,
          child: Center(
            child: Text(
              "Opciones de busqueda",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  ///Boton Cerrar Sesión
  Padding buildCerrarSesion(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 100,
      ),
      child: RaisedButton(
        textColor: Colors.red,
        color: Colors.white,
        onPressed: () {
          _popPage(context);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SingInPage()));
          _authCon.cerrarSesion();
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: Colors.red)),
        child: SizedBox(
          width: 250,
          height: 100,
          child: Center(
            child: Text(
              "Cerrar Sesión",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  ///Cerrar la ventana
  void _popPage(BuildContext context) {
    Navigator.of(context).pop();
  }
}
