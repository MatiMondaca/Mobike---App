import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobike/loginRegister/register/crearClave/crearClave.dart';

class NumeroTelefono extends StatefulWidget {
  @override
  _NumeroTelefonoState createState() => _NumeroTelefonoState();
}

class _NumeroTelefonoState extends State<NumeroTelefono> {
  String numTelefono, idVerificacion, smsCode, numero;

  bool codeSent = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(numero),
            TextFormField(
              onChanged: (value) {
                print(numero);
                this.numero = value;
              },
            ),
            codeSent
                ? TextFormField(
                    onChanged: (value) {
                      this.smsCode = value;
                    },
                  )
                : Container(),
            RaisedButton(onPressed: () {
              verificarTelefono(numero);
            })
          ],
        ),
      ),
    );
  }

  Future<void> verificarTelefono(String numero) async {
    final PhoneVerificationCompleted verificado =
        (PhoneAuthCredential authResult) {
      print(authResult);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CrearClave(),
        ),
      );
    };

    final PhoneVerificationFailed noVerifiado = (FirebaseAuthException e) {
      return Fluttertoast.showToast(
        msg: "No verificado",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    };

    final PhoneCodeSent smsEnviado = (String code, [int forzarReenvio]) {
      this.idVerificacion = code;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeOut = (String code) {
      this.idVerificacion = code;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: numero,
      timeout: Duration(seconds: 60),
      verificationCompleted: verificado,
      verificationFailed: noVerifiado,
      codeSent: smsEnviado,
      codeAutoRetrievalTimeout: autoTimeOut,
    );
  }
}
