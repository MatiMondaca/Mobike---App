import 'package:flutter/material.dart';
import 'package:mobike/Controllers/controladorTarjetaCredito.dart';
import 'package:mobike/localizador.dart';


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
  ControladorTarjeta _controladorTarjeta = locator.get<ControladorTarjeta>();
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
          _controladorTarjeta.setNumero = widget._numerotarjeta.text;
        });
        Navigator.of(context).pop();
      },
      color: Color.fromRGBO(108, 99, 255, 1),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(15.0),
      child: Text(
        "Agregar Tajerta de credito",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
