import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobike/loginRegister/login/autenticacion/auth.dart';

class RecuperarClave extends StatefulWidget {
  @override
  _RecuperarClaveState createState() => _RecuperarClaveState();
}

class _RecuperarClaveState extends State<RecuperarClave> {
  TextEditingController resetEmail = TextEditingController();
  GlobalKey<FormState> _formReset = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
            child: Form(
              key: _formReset,
              child: Column(
                children: [
                  Text(
                    "Enviaremos un correo ... Por favor, verifica tu bandeja de entrada",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: resetEmail,
                    validator: (String val) {
                      if (val.isEmpty || val == null) {
                        return 'Ingrese un correo valido';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                        32.0,
                      )),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_formReset.currentState.validate()) {
                        AutenticacionServicio.resetPassword(
                            email: resetEmail.text.trim());
                        
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
