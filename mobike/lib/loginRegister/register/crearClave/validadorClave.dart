import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditTxTValid extends StatefulWidget {
  bool cbxMinCaracter = false;
  bool cbxMayus = false;
  bool cbxNumero = false;
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

  void validation(String text) {
    // ignore: invalid_use_of_protected_member
    editTxTValidState.setState(() {
      cbxMinCaracter = text.length > 8;
      cbxMayus = _validarMayuscula(text);
      cbxNumero = _validarNumero(text);
    });
  }

  @override
  State<StatefulWidget> createState() {
    return editTxTValidState;
  }
}

class _EditTxTValidState extends State<EditTxTValid> {
  TextStyle estiloCorrecto = TextStyle(
    fontFamily: 'Century-Gothic',
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.green,
  );

  TextStyle estiloIncorrecto = TextStyle(
    fontFamily: 'Century-Gothic',
    fontSize: 16.0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          ///
          /// Validador: Minimo 8 caracteres.
          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                child: widget.cbxMinCaracter
                    ? Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.check_circle,
                        color: Colors.red,
                      ),
              ),
              widget.cbxMinCaracter
                  ? Text(
                      "Mínimo 8 carácteres",
                      textAlign: TextAlign.center,
                      style: estiloCorrecto,
                    )
                  : Text(
                      "Mínimo 8 carácteres",
                      textAlign: TextAlign.center,
                      style: estiloIncorrecto,
                    ),
            ],
          ),

          ///
          /// Validador: Al menos una mayuscula.
          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 5, left: 35),
                child: widget.cbxMayus
                    ? Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.check_circle,
                        color: Colors.red,
                      ),
              ),
              widget.cbxMayus
                  ? Text(
                      "Al menos una mayúscula",
                      textAlign: TextAlign.center,
                      style: estiloCorrecto,
                    )
                  : Text(
                      "Al menos una mayúscula",
                      textAlign: TextAlign.center,
                      style: estiloIncorrecto,
                    ),
            ],
          ),

          ///
          /// Validador: Al menos un numero.
          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                child: widget.cbxNumero
                    ? Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.check_circle,
                        color: Colors.red,
                      ),
              ),
              widget.cbxNumero
                  ? Text(
                      "Al menos un número",
                      textAlign: TextAlign.center,
                      style: estiloCorrecto,
                    )
                  : Text(
                      "Al menos un número",
                      textAlign: TextAlign.center,
                      style: estiloIncorrecto,
                    ),
            ],
          )
        ],
      ),
      padding: EdgeInsets.all(30),
    );
  }
}
