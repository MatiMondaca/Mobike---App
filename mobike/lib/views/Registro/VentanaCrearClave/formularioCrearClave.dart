import 'package:flutter/material.dart';
import 'package:mobike/Controllers/controladorFirebase.dart';
import 'package:mobike/Controllers/controladorTarjetaCredito.dart';
import 'package:mobike/Controllers/controladorUsuario.dart';
import 'package:mobike/Models/modeloUsuario.dart';
import 'package:mobike/localizador.dart';
import 'package:mobike/utils/responsivo.dart';
import 'package:mobike/views/Login/VentanaLogin/loginScreen.dart';
import 'package:mobike/views/Registro/VentanaCrearClave/utils/validadorClave.dart';
import 'package:mobike/views/Registro/VentanaCrearClave/utils/ventanaCarga.dart';

bool _verContrasenna1 = false;
bool _verContrasenna2 = false;

@override
void initState() {
  _verContrasenna1 = false;
  _verContrasenna2 = false;
}

ModeloUsuario _traerDatosUsuario =
    locator.get<UserController>().registrarUsuario;

class FormularioCrearClave extends StatefulWidget {
  FormularioCrearClave({Key key}) : super(key: key);

  @override
  _FormularioCrearClaveState createState() => _FormularioCrearClaveState();
}

class _FormularioCrearClaveState extends State<FormularioCrearClave> {
  String _credito = locator.get<ControladorTarjeta>().getNumero;
  ModeloUsuario _datos = locator.get<UserController>().registrarUsuario;

  ControladorFirebase _authCon = locator.get<ControladorFirebase>();

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
                if (_validarCampoClave.currentState.validate()) {
                  try {
                    //hola
                    _authCon.registrarUsuario(
                      _datos.getRut,
                      _datos.getDisplayName,
                      _datos.getComuna,
                      _credito,
                      _datos.getDireccion,
                      _datos.getCorreo,
                      _contrasennaController.text,
                      _datos.getCelular,
                    );

                    Navigator.of(context)
                        .push(
                      MaterialPageRoute(
                        builder: (context) => VentanaCompeletado(),
                      ),
                    )
                        .timeout(
                      Duration(seconds: 3),
                      onTimeout: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SingInPage(),
                          ),
                        );
                      },
                    );
                  } catch (e) {
                    print(e);
                  }
                }

                // El boton no funciona, pasar los parametros del registro para habilitar
                print(_traerDatosUsuario.comuna);
                print(_credito);
                print(_traerDatosUsuario.correo);
              },
            ),
          ),
          SizedBox(height: responsivo.diagonalPantalla(2.5)),
        ],
      ),
    );
  }
}
