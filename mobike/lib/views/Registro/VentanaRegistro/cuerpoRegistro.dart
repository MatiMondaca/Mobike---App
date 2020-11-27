import 'package:flutter/material.dart';
import 'package:mobike/utils/responsivo.dart';
import 'package:mobike/views/Registro/VentanaRegistro/formularioRegistro.dart';

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
                  FormularioRegistro(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
