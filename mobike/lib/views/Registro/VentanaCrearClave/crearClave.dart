import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:mobike/views/Registro/VentanaCrearClave/cuerpoCrearClave.dart';
import 'package:mobike/views/Registro/VentanaCrearClave/utils/validadorClave.dart';
import 'package:mobike/utils/responsivo.dart';

class CrearClave extends StatelessWidget {
  const CrearClave({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Creación de Contraseña"),
        ),
        body: CuerpoCrearClave(),
      ),
    );
  }
}
