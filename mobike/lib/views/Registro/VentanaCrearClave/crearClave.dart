import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
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

class CuerpoCrearClave extends StatefulWidget {
  CuerpoCrearClave({Key key}) : super(key: key);

  @override
  _CuerpoCrearClaveState createState() => _CuerpoCrearClaveState();
}

class _CuerpoCrearClaveState extends State<CuerpoCrearClave> {
  @override
  Widget build(BuildContext context) {
    final responsivo = Responsivo.of(context);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Text(
              "¡Sólo un paso más!",
              style: TextStyle(
                color: Color.fromRGBO(108, 99, 255, 1),
                fontSize: responsivo.diagonalPantalla(3.4),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Para crear tu contraseña ',
                    style: TextStyle(
                      fontSize: responsivo.diagonalPantalla(1.7),
                    ),
                  ),
                  TextSpan(
                    text: 'asegurate de cumplir\n con los requisitos de esta. ',
                    style: TextStyle(
                      fontSize: responsivo.diagonalPantalla(1.7),
                    ),
                  ),
                  TextSpan(
                    text: '¡No olvides! Estás a un paso de ser parte de ',
                    style: TextStyle(
                      fontSize: responsivo.diagonalPantalla(1.7),
                    ),
                  ),
                  TextSpan(
                    text: 'Mobike.',
                    style: TextStyle(
                      color: Color.fromRGBO(108, 99, 255, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: responsivo.diagonalPantalla(1.7),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Divider(),
            FormularioCrearClave(),
          ],
        ),
      ),
    );
  }
}

bool _verContrasenna1 = false;
bool _verContrasenna2 = false;

@override
void initState() {
  _verContrasenna1 = false;
  _verContrasenna2 = false;
}

class FormularioCrearClave extends StatefulWidget {
  FormularioCrearClave({Key key}) : super(key: key);

  @override
  _FormularioCrearClaveState createState() => _FormularioCrearClaveState();
}

class _FormularioCrearClaveState extends State<FormularioCrearClave> {
  TextEditingController _contrasennaController = TextEditingController();
  TextEditingController _contrasennaRepeatController = TextEditingController();
  GlobalKey<FormState> _validarCampoClave = GlobalKey<FormState>();

  final FocusNode _segundaClave = FocusNode();
  final FocusNode _primeraClave = FocusNode();

  EditTxTValid validadorClave = EditTxTValid();

  @override
  Widget build(BuildContext context) {
    final responsivo = Responsivo.of(context);

    IconButton verClave1 = IconButton(
      icon: _verContrasenna1
          ? Icon(Icons.visibility)
          : Icon(Icons.visibility_off),
      onPressed: () {
        setState(() {
          _verContrasenna1 = !_verContrasenna1;
        });
      },
    );

    IconButton verClave2 = IconButton(
      icon: _verContrasenna2
          ? Icon(Icons.visibility)
          : Icon(Icons.visibility_off),
      onPressed: () {
        setState(() {
          _verContrasenna2 = !_verContrasenna2;
        });
      },
    );

    return Form(
      key: _validarCampoClave,
      child: Column(
        children: [
          TextFormField(
            controller: _contrasennaController,
            focusNode: _primeraClave,
            textInputAction: TextInputAction.next,
            obscureText: !_verContrasenna1,
            decoration: InputDecoration(
              hintText: 'Cree su Contraseña',
              labelText: 'Crear Contraseña',
              prefixIcon: Icon(Icons.lock_outline),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: verClave1,
            ),
            onChanged: (txt) {
              validadorClave.validation(_contrasennaController.text,
                  _contrasennaRepeatController.text);
            },
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(_segundaClave);
            },
          ),
          SizedBox(height: responsivo.diagonalPantalla(3)),
          TextFormField(
            controller: _contrasennaRepeatController,
            focusNode: _segundaClave,
            obscureText: !_verContrasenna2,
            decoration: InputDecoration(
              hintText: 'Reingrese su Contraseña',
              labelText: 'Reingresar Contraseña',
              prefixIcon: Icon(Icons.lock_outline),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: verClave2,
            ),
            onChanged: (txt) {
              validadorClave.validation(_contrasennaController.text,
                  _contrasennaRepeatController.text);
            },
          ),
          Divider(),
          validadorClave,
          Divider(),
          SizedBox(
            width: 300,
            height: 55,
            child: FlatButton(
              child: Text(
                "Crear mi cuenta",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Color.fromRGBO(108, 99, 255, 1),
              onPressed: () {
                // El boton no funciona, pasar los parametros del registro para habilitar
              },
            ),
          ),
          SizedBox(height: responsivo.diagonalPantalla(2.5)),
        ],
      ),
    );
  }
}
