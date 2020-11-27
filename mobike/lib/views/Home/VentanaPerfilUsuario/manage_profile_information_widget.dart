import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobike/localizador.dart';
import 'package:mobike/Models/modeloUsuario.dart';
import 'package:mobike/Controllers/controladorUsuario.dart';
import 'package:flutter/material.dart';
import 'package:mobike/utils/constantes.dart';
import 'package:mobike/utils/responsivo.dart';

class ManageProfileInformationWidget extends StatefulWidget {
  final ModeloUsuario currentUser;

  ManageProfileInformationWidget({this.currentUser});

  @override
  _ManageProfileInformationWidgetState createState() =>
      _ManageProfileInformationWidgetState();
}

class _ManageProfileInformationWidgetState
    extends State<ManageProfileInformationWidget> {
  var _displayNameController = TextEditingController();
  var _passwordController = TextEditingController();
  var _newPasswordController = TextEditingController();
  var _repeatPasswordController = TextEditingController();

  var _formKey = GlobalKey<FormState>();
  String _nombreUsuario;

  bool checkCurrentPasswordValid = true;

  @override
  void initState() {
    _displayNameController.text = widget.currentUser.displayName;
    super.initState();
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
    _repeatPasswordController.dispose();
    setState(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsivo = Responsivo.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(hintText: "Username"),
              controller: _displayNameController,
            ),
            SizedBox(height: 20.0),
            Flexible(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: responsivo.diagonalPantalla(2)),
                    Text(
                      "Administración Contraseña",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: responsivo.diagonalPantalla(2)),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Ingrese su contraseña antigua",
                        errorText: checkCurrentPasswordValid
                            ? null
                            : "Por favor, verifique su contraseña antigua",
                      ),
                      controller: _passwordController,
                    ),
                    SizedBox(height: responsivo.diagonalPantalla(2)),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Nueva contraseña"),
                      controller: _newPasswordController,
                      obscureText: true,
                    ),
                    SizedBox(height: responsivo.diagonalPantalla(2)),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Repita la contraseña",
                      ),
                      obscureText: true,
                      controller: _repeatPasswordController,
                      validator: (value) {
                        return _newPasswordController.text == value
                            ? null
                            : "Por favor, valide la contraseña ingresada";
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: responsivo.anchoPantalla(4)),
            Boton(
              presionar: () async {
                var userController = locator.get<UserController>();

                // if (widget.currentUser.displayName !=
                //     _displayNameController.text) {
                //   var displayName = _displayNameController.text;
                //   userController.updateDisplayName(displayName);
                // }

                checkCurrentPasswordValid = await userController
                    .validateCurrentPassword(_passwordController.text);

                setState(() {});

                if (_formKey.currentState.validate() &&
                    checkCurrentPasswordValid) {
                  userController
                      .updateUserPassword(_newPasswordController.text);
                  Navigator.pop(context);

                  return Fluttertoast.showToast(
                    msg: "Contraseña Actualizada con Exito",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
              textoBoton: 'Guardar Cambios',
              color: Color.fromRGBO(108, 99, 255, 1),
            )
          ],
        ),
      ),
    );
  }
}
