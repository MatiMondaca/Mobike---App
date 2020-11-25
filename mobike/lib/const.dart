import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobike/Controllers/controladorFirebase.dart';
import 'package:mobike/loginRegister/register/registerScreen.dart';
import 'package:mobike/localizador.dart';

const iconBicicleta = 'assets/svg/pinBici.svg';
const iconBicicletaLogin = 'assets/svg/bicicleta.svg';
ControladorFirebase _authCon = locator.get<ControladorFirebase>();
///
/// Titulo AppBar Home
///
Widget appbar = Text(
  "Mobike",
  style: TextStyle(
    color: Colors.black,
    fontSize: 30.0,
  ),
  textAlign: TextAlign.center,
);

var pagRegistro = RegisterScreen(null);

// Cuerpo de la alerta al momento de presionar el boton back
AlertDialog cuerpoAlerta(BuildContext context) {
  return AlertDialog(
    title: Text(
      "¿Seguro que quiere salir de la aplicación?",
      textAlign: TextAlign.left,
    ),
    actions: [
      FlatButton(
        child: Text(
          "No",
          style: TextStyle(fontSize: 15),
        ),
        onPressed: () {
          Navigator.of(context).pop(false);
        },
      ),
      FlatButton(
        child: Text(
          "Si",
          style: TextStyle(fontSize: 15),
        ),
        onPressed: () {
          _authCon.cerrarSesion();
          exit(0);
        },
      ),
    ],
  );
}
