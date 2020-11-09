import 'package:flutter/material.dart';
import 'package:mobike/loginRegister/login/autenticacion/auth.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('MoBike'),
          ),
          body: Container(
            padding: EdgeInsets.only(
              top: 25,
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.black)),
                      child: SizedBox(
                        width: 250,
                        height: 150,
                        child: Center(
                          child: Text(
                            "Opciones de busqueda",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.black)),
                      child: SizedBox(
                          width: 250,
                          height: 150,
                          child: Center(
                              child: Text(
                            "Información de la aplicación",
                            textAlign: TextAlign.center,
                          ))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 100,
                    ),
                    child: RaisedButton(
                      textColor: Colors.red,
                      color: Colors.white,
                      onPressed: () {
                        AutenticacionServicio.cerrarSesion();
                        _popPage(context);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.red)),
                      child: SizedBox(
                        width: 250,
                        height: 100,
                        child: Center(
                          child: Text(
                            "Cerrar Sesión",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _popPage(BuildContext context) {
    Navigator.of(context).pop();
  }
}
