import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobike/loginRegister/register/tarjetaCredito/tarjetaScreen.dart';
import 'package:mobike/const.dart';
import '../../localizador.dart';
import '../../utils/responsivo.dart';
import 'package:mobike/localizador.dart';
import 'package:mobike/Controllers/controladorFirebase.dart';
import 'package:mobike/Controllers/controladorTarjetaCredito.dart';

ControladorFirebase _authCon = locator.get<ControladorFirebase>();
ControladorTarjeta _controladorTarjeta = locator.get<ControladorTarjeta>();

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  static final RegisterScreen _instanciaReg = RegisterScreen._internal();
  RegisterScreen._internal();

  RegisterScreen();

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
  TextEditingController _rutController = TextEditingController();
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _apellidoController = TextEditingController();
  TextEditingController _comunaController = TextEditingController();
  TextEditingController _direccionController = TextEditingController();
  TextEditingController _correoController = TextEditingController();
  TextEditingController _celularController = TextEditingController();

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
          CampoTextoFormulario(
            controller: _rutController,
            hint: 'Ingrese su RUT',
            label: 'RUT',
            helper: 'Con punto y Guión Ej. 11.111.111-1',
            largoMaximo: 12,
            estilo: TextStyle(fontSize: responsivo.diagonalPantalla(1.4)),
            tipoTeclado: TextInputType.text,
            icono: Icon(Icons.person),
          ),
          SizedBox(height: responsivo.diagonalPantalla(2.5)),
          CampoTextoFormulario(
            controller: _nombreController,
            hint: 'Ingrese su Nombre',
            label: 'Nombre',
            tipoTeclado: TextInputType.name,
            icono: Icon(Icons.person),
          ),
          SizedBox(height: responsivo.diagonalPantalla(3.5)),
          CampoTextoFormulario(
            controller: _apellidoController,
            hint: 'Ingrese su Apellido',
            label: 'Apellido',
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
          ),
          SizedBox(height: responsivo.diagonalPantalla(4)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _controladorTarjeta.getNumero == ''
                  ? Text(
                      "Tarjeta de Crédito",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: responsivo.diagonalPantalla(2.5),
                      ),
                    )
                  : Text(
                      _controladorTarjeta.getNumero,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: responsivo.diagonalPantalla(2.5),
                      ),
                    ),
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
          ),
          SizedBox(height: responsivo.diagonalPantalla(3.5)),
          CampoTextoFormulario(
            controller: _correoController,
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
                  width: responsivo.diagonalPantalla(28),
                  child: CampoTextoFormulario(
                    controller: _celularController,
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
            presionar: () {
              try {
                _authCon.registrarUsuario(
                  _rutController.text.trim(),
                  _nombreController.text.trim(),
                  _apellidoController.text.trim(),
                  _apellidoController.text.trim(),
                  _controladorTarjeta.getNumero.trim(),
                  _direccionController.text.trim(),
                  _correoController.text.trim(),
                  'hola123',
                  _celularController.text.trim(),
                );
              } catch (e) {
                print(e);
              }
            },
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
