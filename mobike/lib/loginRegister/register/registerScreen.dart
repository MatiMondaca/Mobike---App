import 'package:flutter/material.dart';
import 'package:mobike/loginRegister/login/loginScreen.dart';
import 'package:mobike/loginRegister/register/tarjetaCredito/tarjetaScreen.dart';
import 'package:mobike/const.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  String numero;
  static final RegisterScreen _instanciaReg = RegisterScreen._internal();
  RegisterScreen._internal();

  factory RegisterScreen(String numero) {
    _instanciaReg.numero = numero ?? '';
    return _instanciaReg;
  }

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController rutController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController comunaController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController correoController = TextEditingController();
  TextEditingController celularController = TextEditingController();

  bool _isCheckeda = false;
  bool _isCheckedb = false;

  void onChangeda(bool value) {
    setState(() {
      _isCheckeda = value;
    });
  }

  void onChangedb(bool value) {
    setState(() {
      _isCheckedb = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: salirApp,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Registro"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                _popPage(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Rut",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                  buildCampoTextoRegistro(rutController),

                  //
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Nombre",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                  buildCampoTextoRegistro(nombreController),

                  //
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Apellido",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                  buildCampoTextoRegistro(apellidoController),

                  //
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Contraseña",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                  buildCampoTextoRegistro(comunaController),

                  //
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Tarjeta de Crédito",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        pagRegistro.numero == ''
                            ? Text(
                                "Número de Tarjeta",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              )
                            : Text(
                                pagRegistro.numero,
                                style: TextStyle(),
                              ),
                        OutlineButton.icon(
                          label: Text("Agregar"),
                          icon: Icon(Icons.add),
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TarjetaCredito(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Dirección",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                  buildCampoTextoRegistro(direccionController),

                  //
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Correo Electronico",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                  buildCampoTextoRegistro(correoController),

                  //
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Celular",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                  buildCampoTextoRegistro(celularController),
                  //
                  CheckboxListTile(
                    title: Text("Acepto términos y condiciones"),
                    value: _isCheckeda,
                    onChanged: (bool value) {
                      onChangeda(value);
                    },
                  ),
                  //
                  CheckboxListTile(
                    title:
                        Text("Quiero recibir correos promocionales de Mobike"),
                    value: _isCheckedb,
                    onChanged: (bool value) {
                      onChangedb(value);
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: RaisedButton(
                          color: Colors.deepPurple,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.deepPurple),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              "¡Estoy Listo!",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          onPressed: () {
                            try {
                              // AutenticacionServicio.registrarUsuario(
                              //     correoController.text,
                              //     claveController.text,
                              //     nombreController.text,
                              //     apellidoController.text,
                              //     rutController.text);
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  //
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///
  /// METODOS - VALIDACIONES
  ///

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  void _popPage(BuildContext context) {
    Navigator.of(context).pop();
  }

  // METODO PARA GENERAR TEXTFIELD - SE AGREGA COMO PARAMETRO CONTROLLER
  Padding buildCampoTextoRegistro(TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  // METODO PARA CONFIRMAR SALIDA DE LA APLICACIÓN
  Future<bool> salirApp() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return cuerpoAlerta(context);
      },
    );
  }
}
