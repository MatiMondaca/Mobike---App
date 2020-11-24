import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobike/home/homeScreen.dart';

import 'package:mobike/const.dart';
import 'package:mobike/loginRegister/login/cargarSiguiente.dart';
import 'package:mobike/loginRegister/register/registerScreen.dart';

import 'autenticacion/auth.dart';
import '../../utils/responsivo.dart';

class SingInPage extends StatefulWidget {
  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VentanaLogin(),
    );
  }
}

class VentanaLogin extends StatefulWidget {
  @override
  _VentanaLoginState createState() => _VentanaLoginState();
}

class _VentanaLoginState extends State<VentanaLogin> {
  bool cargar = false;
  FocusNode _correoFocus = FocusNode();
  FocusNode _claveFocus = FocusNode();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _claveController = TextEditingController();

  GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final responsivo = Responsivo.of(context);
    return Unfocuser(
      child: cargar
          ? CargarPag()
          : Scaffold(
              resizeToAvoidBottomPadding: false,
              body: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        SizedBox(height: responsivo.altoPantalla(2)),
                        Text(
                          "¡Bienvenido otra vez!",
                          style: TextStyle(
                            color: Color.fromRGBO(108, 99, 255, 1),
                            fontSize: responsivo.diagonalPantalla(3.4),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Inicia sesión con tu correo y contraseña",
                          textAlign: TextAlign.center,
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'para ingresar a ',
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Mobike.',
                                style: TextStyle(
                                    color: Color.fromRGBO(108, 99, 255, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: responsivo.diagonalPantalla(7)),
                        Form(
                          key: _formKeyLogin,
                          child: Column(
                            children: [
                              buildTextFormFieldCorreo(),
                              SizedBox(height: responsivo.altoPantalla(4)),
                              buildTextFormFieldClave(),
                              SizedBox(height: responsivo.altoPantalla(1)),
                              Row(
                                children: [
                                  Spacer(),
                                  FlatButton(
                                    onPressed: () {},
                                    child: Text(
                                      "¿Olvidaste tu contraseña?",
                                      style: TextStyle(
                                        fontSize:
                                            responsivo.diagonalPantalla(1.7),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: responsivo.altoPantalla(7)),
                              Boton(
                                textoBoton: "Iniciar Sesión",
                                presionar: () async {
                                  if (_formKeyLogin.currentState.validate()) {
                                    if (validarCorreo(_emailController.text)) {
                                      setState(() => cargar = true);
                                      try {
                                        final user = await AutenticacionServicio
                                            .entrarConEmail(
                                          email: _emailController.text,
                                          password: _claveController.text,
                                        );

                                        print('paso 1 ---');
                                        print(user);
                                        if (user != null) {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => HomePage(),
                                            ),
                                          );
                                          print("Inicio de sesión correcto");
                                        } else {
                                          setState(() => cargar = false);
                                        }
                                      } on FirebaseAuthException catch (e) {
                                        print(e.code);
                                      }
                                    } else {
                                      return Fluttertoast.showToast(
                                        msg: "Correo y/o contraseña invalidos",
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
                                color: Color.fromRGBO(108, 99, 255, 1),
                              ),
                              ParteInferior()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  TextFormField buildTextFormFieldCorreo() {
    return TextFormField(
      controller: _emailController,
      autocorrect: true,
      obscureText: false,
      maxLines: 1,
      minLines: 1,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      focusNode: _correoFocus,
      onFieldSubmitted: (value) =>
          FocusScope.of(context).requestFocus(_claveFocus),
      decoration: InputDecoration(
        hintText: "Ingrese su correo",
        labelText: "Correo",
        prefixIcon: Icon(Icons.email),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildTextFormFieldClave() {
    return TextFormField(
      controller: _claveController,
      autocorrect: true,
      obscureText: true,
      maxLines: 1,
      minLines: 1,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      focusNode: _claveFocus,
      decoration: InputDecoration(
        hintText: "Ingrese su contraseña",
        labelText: "Contraseña",
        prefixIcon: Icon(Icons.lock),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}

// VALIDACION DE FORMATO CORREO
bool validarCorreo(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}

class ParteInferior extends StatelessWidget {
  const ParteInferior({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsivo = Responsivo.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "¿Aún no tienes cuenta? ",
              style: TextStyle(
                fontSize: responsivo.diagonalPantalla(1.6),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegisterScreen(null)));
              },
              child: Text(
                "Regístrate",
                style: TextStyle(
                  color: Color.fromRGBO(108, 99, 255, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: responsivo.diagonalPantalla(1.8),
                ),
              ),
            ),
          ],
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
                    top: constraints.maxHeight * 0.15,
                    left: constraints.maxWidth * 0.2,
                    child: SvgPicture.asset(
                      'assets/svg/bici_persona.svg',
                      width: constraints.maxWidth * 0.65,
                    ),
                  ),
                ],
              ),
            );
          }),
        )
      ],
    );
  }
}
