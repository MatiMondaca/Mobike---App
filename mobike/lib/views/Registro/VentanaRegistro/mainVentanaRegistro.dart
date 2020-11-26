import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:mobike/const.dart';
import 'package:mobike/views/Registro/VentanaRegistro/cuerpoRegistro.dart';
import 'package:mobike/Controllers/controladorTarjetaCredito.dart';
import 'package:mobike/Models/tarjetaCreditoModel.dart';
import 'package:mobike/localizador.dart';

import '../../../Controllers/controladorTarjetaCredito.dart';
import '../VentanaTarjetaCredito/tarjetaScreen.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Registro"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              locator.get<ControladorTarjeta>().initTarjeta();
              _popPage(context);
            },
          ),
        ),
        body: WillPopScope(onWillPop: salirApp, child: CuerpoRegistro()),
      ),
    );
  }

  void _popPage(BuildContext context) {
    Navigator.of(context).pop();
  }

  // METODO PARA GENERAR TEXTFIELD - SE AGREGA COMO PARAMETRO CONTROLLER
  Padding buildCampoTextoRegistro(TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  // METODO PARA CONFIRMAR SALIDA DE LA APLICACIÓN
  Future<bool> salirApp() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return cuerpoAlerta(context);
      },
    );
  }
}
