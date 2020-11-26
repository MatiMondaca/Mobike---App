import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobike/Listo.dart';

import '../../../Controllers/controladorFirebase.dart';
import '../../../const.dart';
import '../../../const.dart';
import '../../../localizador.dart';
import '../../../utils/responsivo.dart';
import '../crearClave/crearClave.dart';
import '../crearClave/crearClave.dart';
import '../crearClave/crearClave.dart';
import '../crearClave/crearClave.dart';

class ValidarCelular extends StatelessWidget {
  const ValidarCelular({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Valida tu Celular"),
        ),
        body: CuerpoValidarCelular(),
      ),
    );
  }
}

class CuerpoValidarCelular extends StatefulWidget {
  @override
  _CuerpoValidarCelularState createState() => _CuerpoValidarCelularState();
}

class _CuerpoValidarCelularState extends State<CuerpoValidarCelular> {
  ControladorFirebase _authCon = locator.get<ControladorFirebase>();
  TextEditingController _numeroCelular = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final responsivo = Responsivo.of(context);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Text(
              "¡Queda muy poco para mover esos pedales!",
              style: TextStyle(
                color: Color.fromRGBO(108, 99, 255, 1),
                fontSize: responsivo.diagonalPantalla(2.6),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: responsivo.diagonalPantalla(1),
            ),
            Text(
              "Ingresa tu número de celular. Te llegará un código de verificación para validar tu teléfono.",
              style: TextStyle(
                fontSize: responsivo.diagonalPantalla(1.6),
              ),
              textAlign: TextAlign.center,
            ),
            Divider(),
            SizedBox(
              child: Column(
                children: [
                  // SizedBox(
                  //   height: responsivo.diagonalPantalla(3),
                  //   child: Text.rich(
                  //     TextSpan(
                  //       children: <TextSpan>[
                  //         TextSpan(text: 'Ingresa tu número de teléfono '),
                  //         TextSpan(
                  //           text: 'Aquí',
                  //           style: TextStyle(
                  //             color: Color.fromRGBO(108, 99, 255, 1),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                  SizedBox(height: responsivo.altoPantalla(2)),
                  SizedBox(
                    height: responsivo.diagonalPantalla(10),
                    child: CampoTextoFormulario(
                      controller: _numeroCelular,
                      label: 'Número Teléfono',
                      icono: Icon(Icons.phone),
                    ),
                  ),

                  SizedBox(
                    height: responsivo.diagonalPantalla(8),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '¡Recuerda!',
                            style: TextStyle(
                              color: Color.fromRGBO(108, 99, 255, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' El número de teléfono debe ir con el código del país, en el caso de Chile seria ',
                          ),
                          TextSpan(
                            text: ' +569.',
                            style: TextStyle(
                              color: Color.fromRGBO(108, 99, 255, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(),
                  Boton(
                    presionar: () async {
                      PhoneVerificationCompleted verificacionCompleta =
                          (AuthCredential credencial) {
                        Navigator.of(context)
                            .push(
                              MaterialPageRoute(
                                builder: (context) => Listo(),
                              ),
                            )
                            .whenComplete(
                              () => Timer(
                                Duration(seconds: 2),
                                () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => CrearClave(),
                                    ),
                                  );
                                },
                              ),
                            );
                      };

                      PhoneVerificationFailed verificacionFallida =
                          (FirebaseAuthException exeption) {
                        print(exeption.code);
                        print(exeption.message);
                      };
                      PhoneCodeSent codigoEnviado =
                          (String verificacionID, [int codigo]) {
                        print("Codigo enviado: $codigo");
                      };

                      final PhoneCodeAutoRetrievalTimeout reenviar =
                          (String verificacionID) {
                        CircularProgressIndicator();
                      };

                      await _auth.verifyPhoneNumber(
                        phoneNumber: _numeroCelular.text.trim(),
                        timeout: Duration(seconds: 60),
                        verificationCompleted: verificacionCompleta,
                        verificationFailed: verificacionFallida,
                        codeSent: codigoEnviado,
                        codeAutoRetrievalTimeout: reenviar,
                      );
                    },
                    textoBoton: 'Validar',
                    color: Color.fromRGBO(108, 99, 255, 1),
                  ),
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: LayoutBuilder(builder: (_, constraints) {
                return Container(
                  child: Stack(
                    children: [
                      Positioned(
                        top: constraints.maxHeight * 0.95,
                        child: Container(
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                          color: Color.fromRGBO(225, 227, 231, 1),
                        ),
                      ),
                      Positioned(
                        top: constraints.maxHeight * 0.20,
                        left: constraints.maxWidth * 0.25,
                        child: SvgPicture.asset(
                          'assets/svg/celular.svg',
                          width: constraints.maxWidth * 0.55,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Future<void> verificarCelular(String celular) async {}
}
