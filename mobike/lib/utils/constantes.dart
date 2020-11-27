import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobike/Controllers/controladorFirebase.dart';
import 'package:mobike/localizador.dart';

// Colores del texto en general
const kColorTexto = Color(0xFF757575);
const kColorTextoSecundario = Color(0xFF979797);

// SVG iconos bicicleta
const iconBicicleta = 'assets/svg/pinBici.svg';
const iconBicicletaLogin = 'assets/svg/bicicleta.svg';
const bicicleta = 'assets/svg/bici.svg';
const cuidado = 'assets/svg/cuidado.svg';

// Boton
class Boton extends StatelessWidget {
  const Boton({
    Key key,
    this.textoBoton,
    this.presionar,
    this.color,
  }) : super(key: key);

  final String textoBoton;
  final Function presionar;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 55,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: color,
        onPressed: presionar,
        child: Text(
          textoBoton,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// Campo de texto para formulario
class CampoTextoFormulario extends StatelessWidget {
  const CampoTextoFormulario({
    this.controller,
    this.estilo,
    this.tipoTeclado,
    this.largoMaximo,
    this.hint,
    this.label,
    this.helper,
    this.icono,
    this.onChanged,
    this.textoPrefijo,
    this.focus,
    this.campoListo,
    this.iconoSufijo,
    this.formater,
    this.validacion,
    this.inputBorder,
  });

  final TextStyle estilo;
  final TextInputType tipoTeclado;
  final int largoMaximo;
  final String hint;
  final String label;
  final String helper;
  final Icon icono;
  final TextEditingController controller;
  final Function onChanged;
  final String textoPrefijo;
  final FocusNode focus;
  final Function campoListo;
  final Icon iconoSufijo;
  final List<TextInputFormatter> formater;
  final Function validacion;
  final InputBorder inputBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: campoListo,
      controller: controller,
      onChanged: onChanged,
      autocorrect: true,
      maxLines: 1,
      minLines: 1,
      focusNode: focus,
      maxLength: largoMaximo,
      keyboardType: tipoTeclado,
      inputFormatters: formater,
      validator: validacion,
      decoration: buildInputDecoration(),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      border: inputBorder,
      prefixText: textoPrefijo,
      suffixIcon: iconoSufijo,
      hintText: hint,
      labelText: label,
      helperText: helper,
      helperStyle: estilo,
      prefixIcon: icono,
      floatingLabelBehavior: FloatingLabelBehavior.always,
    );
  }
}

// Cuerpo de la alerta al momento de presionar el boton back
ControladorFirebase _authCon = locator.get<ControladorFirebase>();

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

void pushPage(BuildContext context, Widget page) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (_) => page),
  );
}

void popPage(BuildContext context) {
  Navigator.of(context).pop();
}
