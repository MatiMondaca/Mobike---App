import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobike/views/Registro/VentanaValidarNumero/utils/VentanaCargaNumero.dart';
import 'package:mobike/const.dart';
import 'package:mobike/utils/responsivo.dart';
import 'package:mobike/views/Registro/VentanaCrearClave/crearClave.dart';

class CuerpoValidarCelular extends StatefulWidget {
  @override
  _CuerpoValidarCelularState createState() => _CuerpoValidarCelularState();
}

class _CuerpoValidarCelularState extends State<CuerpoValidarCelular> {
  // ControladorFirebase _authCon = locator.get<ControladorFirebase>();
  // TextEditingController _numeroCelular = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String phoneNo, smssent, verificationId;
  get verificado => null;

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
                  SizedBox(height: responsivo.altoPantalla(2)),
                  SizedBox(
                    height: responsivo.diagonalPantalla(10),
                    child: CampoTextoFormulario(
                      onChanged: (v) {
                        this.phoneNo = v;
                      },
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
                    presionar: verificarCelular,
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

  Future<void> verificarCelular() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout = (String verId) {
      this.verificationId = verId;
    };

    PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResent]) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Ingresa OTP"),
              content: TextField(
                onChanged: (v) {
                  this.smssent = v;
                },
              ),
              actions: [
                FlatButton(
                  child: Text("Enviar OTP"),
                  onPressed: () {
                    try {
                      print(smssent);
                      print(verificationId);

                      PhoneAuthProvider.credential(
                          verificationId: verId, smsCode: smssent);

                      Navigator.of(context)
                          .push(
                        MaterialPageRoute(
                          builder: (context) => VentanaCargaNumero(),
                        ),
                      )
                          .timeout(
                        Duration(seconds: 2),
                        onTimeout: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CrearClave(),
                            ),
                          );
                        },
                      );
                    } on Exception catch (e) {
                      handleError(e as PlatformException);
                    }
                  },
                )
              ],
            );
          });
    };

    final PhoneVerificationCompleted verificado = (AuthCredential auth) {};

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException e) {
      print('${e.message}');
    };

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 20),
      verificationCompleted: verificado,
      verificationFailed: verificationFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrievalTimeout,
    );
  }

  void handleError(PlatformException error) {
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {
          print('Invalid Code');
        });
        print('Invalid Code');
        break;
      default:
        print('Invalid Code');
        break;
    }
  }
}
