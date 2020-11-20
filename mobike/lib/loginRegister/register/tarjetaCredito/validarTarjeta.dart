import 'package:flutter/material.dart';

import '../../../const.dart';

class ValidarTarjeta extends StatefulWidget {
  const ValidarTarjeta({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required TextEditingController numerotarjeta,
  })  : _formKey = formKey,
        _numerotarjeta = numerotarjeta,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _numerotarjeta;

  @override
  _ValidarTarjetaState createState() => _ValidarTarjetaState();
}

class _ValidarTarjetaState extends State<ValidarTarjeta> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        // Validar el formulario
        if (!widget._formKey.currentState.validate()) {
          return;
        }
        // Pasar a la ventana Registro con el numero de la tarjeta de credito

        print('Numero: ' + widget._numerotarjeta.text);
        setState(() {
          pagRegistro.numero = widget._numerotarjeta.text;
        });
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => pagRegistro));
      },
      color: Colors.green[400],
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: EdgeInsets.all(15.0),
      child: Text(
        "Agregar Tajerta de credito",
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Century-Gothic',
        ),
      ),
    );
  }
}
