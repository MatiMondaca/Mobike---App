import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobike/loginRegister/register/tarjetaCredito/tarjetaScreen.dart';
import 'package:mobike/const.dart';
import '../../utils/responsivo.dart';

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
  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Registro"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              _popPage(context);
            },
          ),
        ),
        body: CuerpoRegistro(),
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

class CuerpoRegistro extends StatelessWidget {
  const CuerpoRegistro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsivo = Responsivo.of(context);
    return ListView(
      children: [
        SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Text(
                    "¡Comienza tu aventura!",
                    style: TextStyle(
                      color: Color.fromRGBO(108, 99, 255, 1),
                      fontSize: responsivo.diagonalPantalla(3.1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Para ser parte de está comunidad \nregistra tus datos aquí abajo.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: responsivo.diagonalPantalla(1.6),
                      color: Color(0XFF8B8B8B),
                    ),
                  ),
                  Divider(),
                  FormularioRegistro(null),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class FormularioRegistro extends StatefulWidget {
  String numero;
  static final FormularioRegistro _instanciaReg =
      FormularioRegistro._internal();
  FormularioRegistro._internal();

  factory FormularioRegistro(String numero) {
    _instanciaReg.numero = numero ?? '';
    return _instanciaReg;
  }

  @override
  _FormularioRegistroState createState() => _FormularioRegistroState();
}

class _FormularioRegistroState extends State<FormularioRegistro> {
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
      child: Column(
        children: [
          CampoTextoRegistro(
            hint: 'Ingrese su RUT',
            label: 'RUT',
            helper: 'Con punto y Guión Ej. 11.111.111-1',
            largoMaximo: 12,
            estilo: TextStyle(fontSize: responsivo.diagonalPantalla(1.4)),
            tipoTeclado: TextInputType.text,
            icono: Icon(Icons.person),
          ),
          SizedBox(height: responsivo.diagonalPantalla(2.5)),
          CampoTextoRegistro(
            hint: 'Ingrese su Nombre',
            label: 'Nombre',
            tipoTeclado: TextInputType.name,
            icono: Icon(Icons.person),
          ),
          SizedBox(height: responsivo.diagonalPantalla(3.5)),
          CampoTextoRegistro(
            hint: 'Ingrese su Apellido',
            label: 'Apellido',
            tipoTeclado: TextInputType.name,
            icono: Icon(Icons.person),
          ),
          SizedBox(height: responsivo.diagonalPantalla(3.5)),
          CampoTextoRegistro(
            hint: '¿En que comúna vive? Eliga una.',
            label: 'Comuna',
            helper: 'La Reina / Providencia / ÑuÑoa / Otra.',
            estilo: TextStyle(fontSize: responsivo.diagonalPantalla(1.5)),
            icono: Icon(Icons.local_library),
          ),
          SizedBox(height: responsivo.diagonalPantalla(4)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              pagRegistro.numero == ''
                  ? Text(
                      "Tarjeta de Crédito",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: responsivo.diagonalPantalla(2.5),
                      ),
                    )
                  : Text(
                      pagRegistro.numero,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: responsivo.diagonalPantalla(2.5),
                      ),
                    ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TarjetaCredito(),
                    ),
                  );
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
          CampoTextoRegistro(
            hint: 'Ingrese su Dirección',
            label: 'Dirección',
            icono: Icon(Icons.home),
          ),
          SizedBox(height: responsivo.diagonalPantalla(3.5)),
          CampoTextoRegistro(
            hint: 'Ingrese su Correo',
            label: 'Correo',
            icono: Icon(Icons.email),
          ),
          SizedBox(height: responsivo.diagonalPantalla(3.5)),
          SizedBox(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "+569",
                    style: TextStyle(fontSize: responsivo.diagonalPantalla(3)),
                  ),
                ),
                Container(
                  width: responsivo.diagonalPantalla(29),
                  child: CampoTextoRegistro(
                    hint: 'Ingrese su Celular',
                    label: 'Celular',
                    icono: Icon(Icons.phone),
                    tipoTeclado: TextInputType.phone,
                  ),
                )
              ],
            ),
          ),
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
            presionar: () {},
            textoBoton: '¡Estoy Listo!',
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
}

class CampoTextoRegistro extends StatelessWidget {
  const CampoTextoRegistro({
    this.controller,
    this.estilo,
    this.tipoTeclado,
    this.largoMaximo,
    this.hint,
    this.label,
    this.helper,
    this.icono,
    this.onChanged,
    this.textoPrefijo,
  });

  final TextStyle estilo;
  final TextInputType tipoTeclado;
  final int largoMaximo;
  final String hint;
  final String label;
  final String helper;
  final Icon icono;
  final TextEditingController controller;
  final Function onChanged;
  final String textoPrefijo;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      autocorrect: true,
      maxLines: 1,
      minLines: 1,
      maxLength: largoMaximo,
      keyboardType: tipoTeclado,
      decoration: buildInputDecoration(),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      prefixText: textoPrefijo,
      hintText: hint,
      labelText: label,
      helperText: helper,
      helperStyle: estilo,
      prefixIcon: icono,
      floatingLabelBehavior: FloatingLabelBehavior.always,
    );
  }
}
