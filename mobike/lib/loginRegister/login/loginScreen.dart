import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:provider/provider.dart';
import 'autenticacion/auth.dart';
import 'package:latlong/latlong.dart';

class SingInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextStyle estilo = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Title(
                color: Colors.black,
                child: Text(
                  "MoBike",
                  style: TextStyle(
                    fontSize: 90.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextFormField(
                textAlign: TextAlign.center,
                obscureText: false,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                style: estilo,
                validator: (String val) {
                  if (val.isEmpty) {
                    return "Ingrese un correo valido";
                  }
                  return null;
                },
                controller: emailController,
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
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextFormField(
                textAlign: TextAlign.center,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                validator: (String val) {
                  if (val.isEmpty) {
                    return "Ingrese un correo valido";
                  }
                  return null;
                },
                controller: passController,
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                color: Colors.blue,
                onPressed: () {
                  try {
                    context.read<AutenticacionServicio>().signIn(
                          email: emailController.text.trim(),
                          password: passController.text.trim(),
                        );
                  } catch (e) {
                    return print(e);
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
          ],
        ),
      ),
    );
  }
}
