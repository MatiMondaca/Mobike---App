import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobike/Controllers/controladorFirebase.dart';
import 'package:mobike/Controllers/controladorUsuario.dart';
import 'package:mobike/Models/modeloUsuario.dart';
import 'package:mobike/api/API_MapBox.dart';
import 'package:mobike/localizador.dart';
import 'package:mobike/utils/constantes.dart';
import 'package:mobike/utils/responsivo.dart';
import 'package:mobike/views/Home/VentanaAsistencia/AssistPage.dart';
import 'package:mobike/views/Home/VentanaConfiguracion/settingScreen.dart';
import 'package:mobike/views/Home/VentanaPerfilUsuario/userPerfil.dart';

class HomePage extends StatelessWidget {
  static ModeloUsuario _traerDatosUsuario =
      locator.get<UserController>().registrarUsuario;

  var us = locator.get<UserController>();
  var authCon = locator.get<ControladorFirebase>();
  @override
  Widget build(BuildContext context) {
    final responsivo = Responsivo.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "MoBike",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.person),
          color: Color.fromRGBO(108, 99, 255, 1),
          iconSize: 30,
          onPressed: () {
            us.getUserData(authCon.obtenerUsuario().getUid);
            print(_traerDatosUsuario.getCorreo);
            print('${_traerDatosUsuario.getRut} Yo');
            print('${_traerDatosUsuario.rut} sdfsdfsdfsdfd');
            pushPage(context, ProfileView());
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            color: Color.fromRGBO(108, 99, 255, 1),
            iconSize: 30,
            onPressed: () {
              pushPage(context, SettingsScreen());
            },
          ),
        ],
      ),
      body: CuerpoHome(),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        notchMargin: 10,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: responsivo.diagonalPantalla(7),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        bicicleta,
                        height: 50,
                      ),
                      SizedBox(
                        child: Text(" = 11"),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SizedBox(
                  height: responsivo.diagonalPantalla(7),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset("assets/alerta.png"),
                        iconSize: 25,
                        onPressed: () {
                          pushPage(context, AssistPage());
                        },
                      ),
                      SizedBox(
                        child: Text("  Asistencia"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search_sharp),
        elevation: 7,
        backgroundColor: Color.fromRGBO(108, 99, 255, 1),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CuerpoHome extends StatefulWidget {
  @override
  _CuerpoHomeState createState() => _CuerpoHomeState();
}

class _CuerpoHomeState extends State<CuerpoHome> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: MapMobike(),
    );
  }
}
