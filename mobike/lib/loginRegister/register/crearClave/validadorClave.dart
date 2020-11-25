import 'package:flutter/material.dart';
import 'package:mobike/utils/responsivo.dart';

// ignore: must_be_immutable
class EditTxTValid extends StatefulWidget {
  bool cbxMinCaracter = false;
  bool cbxMayus = false;
  bool cbxNumero = false;
  bool cbxIgualdad = false;
  var editTxTValidState = _EditTxTValidState();

  bool _validarMayuscula(String clave) {
    Pattern pattern = '^(?=.*[A-Z])';
    RegExp regExp = RegExp(pattern);
    return (regExp.hasMatch(clave)) ? true : false;
  }

  bool _validarNumero(String clave) {
    Pattern pattern = '^(?=.*[0-9])';
    RegExp regExp = RegExp(pattern);
    return (regExp.hasMatch(clave)) ? true : false;
  }

  void validation(String text, String text2) {
    // ignore: invalid_use_of_protected_member
    editTxTValidState.setState(() {
      cbxMinCaracter = text.length >= 8;
      cbxMayus = _validarMayuscula(text);
      cbxNumero = _validarNumero(text);
      if (cbxMinCaracter) {
        cbxIgualdad = text == text2;
      } else {
        cbxIgualdad = false;
      }
      print(cbxIgualdad);
    });
  }

  @override
  State<StatefulWidget> createState() {
    return editTxTValidState;
  }
}

class _EditTxTValidState extends State<EditTxTValid> {
  @override
  Widget build(BuildContext context) {
    final responsivo = Responsivo.of(context);

    TextStyle estiloCorrecto = TextStyle(
      fontSize: responsivo.diagonalPantalla(2),
    );

    TextStyle estiloIncorrecto = TextStyle(
      fontSize: responsivo.diagonalPantalla(2),
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );

    Icon iconoCorrecto = Icon(
      Icons.check_circle,
      color: Colors.green,
    );

    Icon iconoIncorrecto = Icon(
      Icons.check_circle_outline,
      color: Colors.red,
    );

    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 2, top: 4),
                child: Container(
                  child:
                      widget.cbxMinCaracter ? iconoCorrecto : iconoIncorrecto,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Container(
                  child: widget.cbxMayus ? iconoCorrecto : iconoIncorrecto,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Container(
                  child: widget.cbxNumero ? iconoCorrecto : iconoIncorrecto,
                ),
              ),
              Container(
                child: widget.cbxIgualdad ? iconoCorrecto : iconoIncorrecto,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.cbxMinCaracter
                  ? Text("Mínimo 8 caracteres", style: estiloIncorrecto)
                  : Text("Mínimo 8 caracteres", style: estiloCorrecto),
              widget.cbxMayus
                  ? Text("Al menos una mayúscula", style: estiloIncorrecto)
                  : Text("Al menos una mayúscula", style: estiloCorrecto),
              widget.cbxNumero
                  ? Text("Al menos un número", style: estiloIncorrecto)
                  : Text("Al menos un número", style: estiloCorrecto),
              widget.cbxIgualdad
                  ? Text("Las contraseñas coinciden", style: estiloIncorrecto)
                  : Text("Las contraseñas coinciden", style: estiloCorrecto),
            ],
          ),
        ],
      ),
    );
  }
}
