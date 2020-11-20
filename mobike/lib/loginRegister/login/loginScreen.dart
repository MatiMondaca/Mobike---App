import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobike/home/homeScreen.dart';

import 'package:mobike/const.dart';
import 'package:mobike/loginRegister/login/cargarSiguiente.dart';
import 'package:mobike/loginRegister/login/recuperarContrase%C3%B1a/recuperarClave.dart';

import 'autenticacion/auth.dart';

class SingInPage extends StatefulWidget {
  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passController = TextEditingController();

  final TextStyle estilo = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();

  bool cargar = false;

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: WillPopScope(
        onWillPop: salirApp,
        child: SafeArea(
          child: cargar
              ? CargarPag()
              : Scaffold(
                  backgroundColor: Colors.white,
                  body: SingleChildScrollView(
                    child: Form(
                      key: _formKeyLogin,
                      child: Column(
                        children: [
                          ///
                          /// Titulo 'Mobike'
                          ///
                          Title(
                            color: Colors.black,
                            child: Text(
                              "MoBike",
                              style: TextStyle(
                                fontSize: 60.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),

                          ///
                          /// METODOS => CORREO - CONTRASEÑA
                          /// TextFormField convertidos en metodos para orderar el código
                          ///
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: buildCorreo(context),
                          ), // Correo
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: buildPassword(context),
                          ), // Contraseña

                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, bottom: 10.0, right: 20.0),
                            child: Container(
                              width: double.infinity,
                              child: InkWell(
                                onTap: () {
                                  _pushPage(context, RecuperarClave());
                                },
                                child: Text(
                                  "¿Olvidó su contraseña?",
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          ),

                          ///
                          /// Botón Inicio de Sesión
                          ///
                          RaisedButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            color: Colors.blue,
                            onPressed: () async {
                              if (_formKeyLogin.currentState.validate()) {
                                if (validarCorreo(_emailController.text)) {
                                  setState(() => cargar = true);
                                  try {
                                    final user = await AutenticacionServicio
                                        .entrarConEmail(
                                      email: _emailController.text,
                                      password: _passController.text,
                                    );

                                    print('paso 1 ---');
                                    print(user);
                                    if (user != null) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()),
                                      );
                                      print("Inicio de sesión correcto");
                                    } else {
                                      setState(() => cargar = false);
                                    }
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      return Fluttertoast.showToast(
                                        msg: "Cuenta no encontrada",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                    }
                                  }
                                } else {
                                  return Fluttertoast.showToast(
                                    msg: "Correo invalido",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                }
                              }
                            },
                            child: Text(
                              "Iniciar Sesión",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),

                          ///
                          /// Botón Registrarse
                          ///
                          FlatButton(
                            onPressed: () {
                              pagRegistro.numero = '';
                              _popPage(context);
                              _pushPage(context, pagRegistro);
                            },
                            child: Text("Registrarse"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  ///
  /// METODOS - VALIDACIONES
  ///

  // CAMPO DE CORREO
  TextFormField buildCorreo(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      obscureText: false,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
      style: estilo,
      validator: (String val) {
        if (!val.contains("@")) {
          return "Ingrese un correo valido";
        }
        if (val.isEmpty || val == null) {
          return 'Ingrese un correo valido';
        }
        return null;
      },
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            32.0,
          ),
        ),
      ),
    );
  }

  // CAMPO DE CONTRASEÑA
  TextFormField buildPassword(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
      validator: (String val) {
        if (val.isEmpty || val == null) {
          return "Ingrese una contraseña valida";
        }
        return null;
      },
      controller: _passController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      style: estilo,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Contraseña",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        isDense: true,
      ),
    );
  }

  // VALIDACION DE FORMATO CORREO
  bool validarCorreo(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  // METODOS PUSH - POP
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  void _popPage(BuildContext context) {
    Navigator.of(context).pop();
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
