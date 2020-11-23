

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobike/home/homeScreen.dart';

import 'package:mobike/const.dart';
import 'package:mobike/loginRegister/login/cargarSiguiente.dart';
import 'package:mobike/loginRegister/login/recuperarContrase%C3%B1a/recuperarClave.dart';
import 'package:mobike/loginRegister/register/registerScreen.dart';

import 'autenticacion/auth.dart';

class SingInPage extends StatefulWidget {
  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VentanaLogin(),
      theme: theme(),
    );
  }

  ThemeData theme() {
    return ThemeData(
      inputDecorationTheme: inputDecorationTheme(),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Muli",
      brightness: Brightness.light,
      appBarTheme: appBarTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  AppBarTheme appBarTheme() {
    return AppBarTheme(
      color: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Color(0XFF8B8B8B),
          fontSize: 20,
        ),
      ),
    );
  }

  InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: Color(0XFF8B8B8B)),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: Color(0XFF8B8B8B)),
        gapPadding: 10,
      ),
    );
  }
}

class VentanaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: Scaffold(
        // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Inicio de Sesión"),
        ),
        body: CuerpoLogin(),
      ),
    );
  }
}

class CuerpoLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  "¡Bienvenido de vuelta!",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 96, 39, 1),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Inicia sesión con tu correo y contraseña \npara ingresar.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 70),
                FormularioDatos(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormularioDatos extends StatefulWidget {
  @override
  _FormularioDatosState createState() => _FormularioDatosState();
}

class _FormularioDatosState extends State<FormularioDatos> {
  FocusNode _correoFocus = FocusNode();
  FocusNode _claveFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildTextFormFieldCorreo(),
          SizedBox(height: 30.0),
          buildTextFormFieldClave(),
          SizedBox(height: 5.0),
          Row(
            children: [
              Spacer(),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "¿Olvidaste tu contraseña?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 40.0),
          Boton(
            textoBoton: "Iniciar Sesión",
            presionar: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "¿Aún no tienes cuenta? ",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              FlatButton(
                onPressed: ventanaRegistrarse,
                child: Text(
                  "Regístrate",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 96, 39, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextFormField buildTextFormFieldCorreo() {
    return TextFormField(
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

  Future<void> ventanaRegistrarse() {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RegisterScreen(null)));
  }
}

class Boton extends StatelessWidget {
  const Boton({
    Key key,
    this.textoBoton,
    this.presionar,
  }) : super(key: key);

  final String textoBoton;
  final Function presionar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 55,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color.fromRGBO(255, 96, 39, 1),
        onPressed: presionar,
        child: Text(
          textoBoton,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
