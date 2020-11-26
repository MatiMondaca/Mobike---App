import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';

import 'package:mobike/views/Registro/VentanaValidarNumero/cuerpoValidarNumero.dart';

class ValidarCelular extends StatelessWidget {
  const ValidarCelular({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Valida tu Celular"),
        ),
        body: CuerpoValidarCelular(),
      ),
    );
  }
}
