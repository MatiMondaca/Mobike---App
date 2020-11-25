import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobike/loginRegister/register/crearClave/crearClave.dart';

class NumeroTelefono extends StatefulWidget {
  NumeroTelefono({Key key}) : super(key: key);

  @override
  _NumeroTelefonoState createState() => _NumeroTelefonoState();
}

class _NumeroTelefonoState extends State<NumeroTelefono> {
  TextEditingController _numeroCelular = TextEditingController();
  TextEditingController _optToken = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  autententicacionCelular() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: _numeroCelular.text,
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credencial) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CrearClave()),
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.code);
        print("Error: ${e.message}");
      },
      codeSent: (String verificacionID, int reenviarToken) {
        print(verificacionID);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Ingresa el codigo"),
              content: Column(
                children: [
                  TextField(
                    controller: _optToken,
                  ),
                  RaisedButton(
                    child: Text("Validar"),
                    onPressed: () {
                      try {
                        String smsCodigo = _optToken.text.trim();
                        PhoneAuthProvider.credential(
                          verificationId: verificacionID,
                          smsCode: smsCodigo,
                        );
                        print(_optToken.text);
                      } on Exception catch (e) {
                        print(e);
                      }
                    },
                  )
                ],
              ),
            );
          },
        );
      },
      codeAutoRetrievalTimeout: (String verificacionID) {
        print(verificacionID);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _numeroCelular,
            ),
            RaisedButton(
              child: Text("Enviar"),
              onPressed: () {
                autententicacionCelular();
              },
            ),
          ],
        ),
      ),
    );
  }
}
