// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobike/Controllers/controladorFirebase.dart';
import 'package:mobike/Controllers/controladorTarjetaCredito.dart';
import 'package:mobike/Controllers/controladorUsuario.dart';
import 'package:mobike/Models/modeloUsuario.dart';
import 'package:mobike/localizador.dart';
import 'package:mobike/utils/constantes.dart';
import 'package:mobike/views/Registro/VentanaTarjetaCredito/tarjetaScreen.dart';
import 'package:mobike/utils/responsivo.dart';
import 'package:mobike/views/Registro/VentanaValidarNumero/mainValidadNumero.dart';

class FormularioRegistro extends StatefulWidget {
  @override
  _FormularioRegistroState createState() => _FormularioRegistroState();
}

class _FormularioRegistroState extends State<FormularioRegistro> {
  //Controladores
  ControladorTarjeta _controladorTarjeta = locator.get<ControladorTarjeta>();
  ModeloUsuario _datos = locator.get<UserController>().registrarUsuario;

  // Controllers TextFormField
  TextEditingController _rutController = TextEditingController();
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _comunaController = TextEditingController();
  TextEditingController _direccionController = TextEditingController();
  TextEditingController _correoController = TextEditingController();
  GlobalKey<FormState> _keyValidar = GlobalKey<FormState>();

  String dropdownValue = '';
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
    final responsivo = Responsivo.of(context);
    return Form(
      key: _keyValidar,
      child: Column(
        children: [
          CampoTextoFormulario(
            controller: _rutController,
            hint: 'Ingrese su RUT',
            label: 'RUT',
            helper: 'Con punto y Guión Ej. 11.111.111-1',
            largoMaximo: 12,
            estilo: TextStyle(fontSize: responsivo.diagonalPantalla(1.4)),
            tipoTeclado: TextInputType.text,
            icono: Icon(Icons.person),
            inputBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal),
            ),
          ),
          SizedBox(height: responsivo.diagonalPantalla(2.5)),
          CampoTextoFormulario(
            controller: _nombreController,
            hint: 'Ingrese su Nombre completo',
            label: 'Nombre completo',
            tipoTeclado: TextInputType.name,
            icono: Icon(Icons.person),
          ),
          SizedBox(height: responsivo.diagonalPantalla(3.5)),
          CampoTextoFormulario(
            controller: _comunaController,
            hint: '¿En que comúna vive? Eliga una.',
            label: 'Comuna',
            helper: 'La Reina / Providencia / ÑuÑoa / Otra.',
            estilo: TextStyle(fontSize: responsivo.diagonalPantalla(1.5)),
            icono: Icon(Icons.local_library),
            validacion: (String v) {
              if (_comunaController.text == "La Reina" ||
                  _comunaController.text == "la reina" ||
                  _comunaController.text == "Providencia" ||
                  _comunaController.text == "providencia" ||
                  _comunaController.text == "Ñuñoa" ||
                  _comunaController.text == "ñuñoa" ||
                  _comunaController.text == "Otra" ||
                  _comunaController.text == "otra") {
                return;
              }
            },
          ),
          SizedBox(height: responsivo.diagonalPantalla(4)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              condicionText(),
              FlatButton(
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TarjetaCredito(),
                    ),
                  );
                  setState(() {});
                },
                child: Text(
                  "+ Agregar tarjeta",
                  style: TextStyle(
                    color: Color.fromRGBO(108, 99, 255, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: responsivo.diagonalPantalla(1.8),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: responsivo.diagonalPantalla(3)),
          CampoTextoFormulario(
            controller: _direccionController,
            hint: 'Ingrese su Dirección',
            label: 'Dirección',
            icono: Icon(Icons.home),
            tipoTeclado: TextInputType.text,
          ),
          SizedBox(height: responsivo.diagonalPantalla(3.5)),
          CampoTextoFormulario(
            controller: _correoController,
            hint: 'Ingrese su Correo',
            label: 'Correo',
            icono: Icon(Icons.email),
            tipoTeclado: TextInputType.emailAddress,
          ),
          SizedBox(height: responsivo.diagonalPantalla(3.5)),
          Divider(),
          CheckboxListTile(
            title: Text(
              "Acepto términos y condiciones",
              style: TextStyle(
                fontSize: responsivo.diagonalPantalla(1.6),
              ),
              textAlign: TextAlign.right,
            ),
            value: _isCheckeda,
            onChanged: (bool value) {
              onChangeda(value);
            },
          ),
          CheckboxListTile(
            title: Text(
              "Quiero recibir correos promocionales de Mobike",
              style: TextStyle(
                fontSize: responsivo.diagonalPantalla(1.6),
              ),
              textAlign: TextAlign.right,
            ),
            value: _isCheckedb,
            onChanged: (bool value) {
              onChangedb(value);
            },
          ),
          Divider(),
          Boton(
            presionar: () {
              if (_keyValidar.currentState.validate() &&
                  _isCheckedb &&
                  _isCheckeda) {
                try {
                  //_guardarDatosUser.datosUsuario(
                  _datos.setRut = _rutController.text.trim();
                  _datos.setDisplayName = _nombreController.text.trim();
                  _datos.setComuna = _comunaController.text.trim();
                  _datos.setDireccion = _direccionController.text.trim();
                  _datos.setCorreo = _correoController.text.trim();

                  pushPage(context, ValidarCelular());
                } on Exception catch (e) {
                  print(e);
                }
              } else {
                return Fluttertoast.showToast(
                  msg: "Debes aceptar los terminos y condiciones",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
            },
            textoBoton: 'Siguiente',
            color: Color.fromRGBO(108, 99, 255, 1),
          ),
          SizedBox(height: responsivo.diagonalPantalla(1.5)),
          Text(
            "¡Estas a un paso de hacer la direfencia!",
            style: TextStyle(
              fontSize: responsivo.diagonalPantalla(1.6),
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: responsivo.diagonalPantalla(3)),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: LayoutBuilder(builder: (_, constraints) {
              return Container(
                child: Stack(
                  children: [
                    Positioned(
                      top: constraints.maxHeight * 0.785,
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
                        'assets/svg/persona_sentada.svg',
                        width: constraints.maxWidth * 0.65,
                      ),
                    ),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget condicionText() {
    final responsivo = Responsivo.of(context);
    if (_controladorTarjeta.getNumero == '') {
      return Text(
        "Tarjeta de Crédito",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: responsivo.diagonalPantalla(2.5),
        ),
      );
    } else {
      return Text(
        _controladorTarjeta.getNumero,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: responsivo.diagonalPantalla(2.5),
        ),
      );
    }
  }
}
