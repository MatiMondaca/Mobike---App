// import 'package:flutter/material.dart';
// import 'package:mobike/Controllers/controladorFirebase.dart';

// import '../../../localizador.dart';

// class RecuperarClave extends StatefulWidget {
//   @override
//   _RecuperarClaveState createState() => _RecuperarClaveState();
// }

// class _RecuperarClaveState extends State<RecuperarClave> {
//   TextEditingController resetEmail = TextEditingController();
//   GlobalKey<FormState> _formReset = GlobalKey<FormState>();
//   ControladorFirebase _authCon = locator.get<ControladorFirebase>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
//             child: Form(
//               key: _formReset,
//               child: Column(
//                 children: [
//                   Text(
//                     "Enviaremos un correo ... Por favor, verifica tu bandeja de entrada",
//                     style: TextStyle(fontSize: 20.0),
//                   ),
//                   TextFormField(
//                     textAlign: TextAlign.center,
//                     controller: resetEmail,
//                     validator: (String val) {
//                       if (val.isEmpty || val == null) {
//                         return 'Ingrese un correo valido';
//                       }
//                       return null;
//                     },
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       contentPadding:
//                           EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                       labelText: "Email",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(
//                         32.0,
//                       )),
//                     ),
//                   ),
//                   RaisedButton(
//                     onPressed: () {
//                       if (_formReset.currentState.validate()) {
//                         _authCon.resetPassword(
//                           email: resetEmail.text.trim(),
//                         );
//                       }
//                     },
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobike/Controllers/controladorFirebase.dart';
import 'package:mobike/localizador.dart';
import 'package:mobike/utils/constantes.dart';
import 'package:mobike/utils/responsivo.dart';

class RecuperarClave extends StatelessWidget {
  const RecuperarClave({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Recuperar contraseña"),
      ),
      body: CuerpoRecuperarClave(),
    );
  }
}

class CuerpoRecuperarClave extends StatefulWidget {
  CuerpoRecuperarClave({Key key}) : super(key: key);

  @override
  _CuerpoRecuperarClaveState createState() => _CuerpoRecuperarClaveState();
}

class _CuerpoRecuperarClaveState extends State<CuerpoRecuperarClave> {
  TextEditingController _resetEmail = TextEditingController();
  ControladorFirebase _authCon = locator.get<ControladorFirebase>();
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
              "¿olvidaste tu contraseña?",
              style: TextStyle(
                color: Color.fromRGBO(108, 99, 255, 1),
                fontSize: responsivo.diagonalPantalla(2.6),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: responsivo.diagonalPantalla(1)),
            Text(
              "¡No hay problema! Ingresa tu correo asociado a la cuenta para recibir un link, en el cual podrás reestablecer tu contraseña.",
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
                      controller: _resetEmail,
                      tipoTeclado: TextInputType.emailAddress,
                      estilo: TextStyle(fontSize: 7),
                      label: 'Correo asociado a tu cuenta',
                      icono: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: responsivo.diagonalPantalla(1)),
                  Divider(),
                  Boton(
                    presionar: () {
                      if (_resetEmail.text.isNotEmpty) {
                        try {
                          _authCon.resetPassword(
                              email: _resetEmail.text.trim());
                        } on Exception catch (e) {
                          print(e);
                        }
                      } else {
                        return Fluttertoast.showToast(
                          msg: "Debes ingresar un correo valido",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    },
                    textoBoton: 'Enviar link a mi correo',
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
}
