import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobike/loginRegister/register/registerScreen.dart';

import 'autenticacion/auth.dart';

class SingInPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextStyle estilo = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Title(
                    color: Colors.black,
                    child: Text(
                      "MoBike",
                      style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    obscureText: false,
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    style: estilo,
                    validator: (String val) {
                      if (!val.contains("@")) {
                        return "Ingrese un correo valido";
                      } else {
                        return null;
                      }
                    },
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          32.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    validator: (String val) {
                      if (val.isEmpty) {
                        return "Ingrese un correo valido";
                      }
                      return '';
                    },
                    controller: _passController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    style: estilo,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      labelText: "Contraseña",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      isDense: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    color: Colors.blue,
                    onPressed: () async {
                      if (_emailController.text.isEmpty ||
                          _passController.text.isEmpty) {
                        return Fluttertoast.showToast(
                            msg: "Correo y contraseña no pueden estar vacios",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (!validarCorreo(_emailController.text)) {
                        return Fluttertoast.showToast(
                            msg: "Correo invalido",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        try {
                          final user =
                              await AutenticacionServicio.entrarConEmail(
                                  email: _emailController.text,
                                  password: _passController.text);
                          print('paso 1');
                          if (user != null) {
                            print("Inicio de sesión correcto");
                          }
                        } on FirebaseAuthException catch (e) {
                          print('error 1');
                          if (e.code == 'user-not-found') {
                            
                              return Fluttertoast.showToast(
                                  msg: "Cuenta no encontrada",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            
                          }
                        }
                      }
                    },
                    child: Text(
                      "Iniciar Sesión",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                FlatButton(
                    onPressed: () {
                      _pushPage(context, RegisterScreen());
                    },
                    child: Text("Registrarse"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validarCorreo(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
