import 'package:flutter/material.dart';
import 'package:mobike/utils/responsivo.dart';
import 'package:mobike/views/Registro/VentanaCrearClave/crearClave.dart';
import 'package:mobike/views/Registro/VentanaCrearClave/formularioCrearClave.dart';

class CuerpoCrearClave extends StatefulWidget {
  @override
  _CuerpoCrearClaveState createState() => _CuerpoCrearClaveState();
}

class _CuerpoCrearClaveState extends State<CuerpoCrearClave> {
  @override
  Widget build(BuildContext context) {
    final responsivo = Responsivo.of(context);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Text(
              "¡Sólo un paso más!",
              style: TextStyle(
                color: Color.fromRGBO(108, 99, 255, 1),
                fontSize: responsivo.diagonalPantalla(3.4),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Para crear tu contraseña ',
                    style: TextStyle(
                      fontSize: responsivo.diagonalPantalla(1.7),
                    ),
                  ),
                  TextSpan(
                    text: 'asegurate de cumplir\n con los requisitos de esta. ',
                    style: TextStyle(
                      fontSize: responsivo.diagonalPantalla(1.7),
                    ),
                  ),
                  TextSpan(
                    text: '¡No olvides! Estás a un paso de ser parte de ',
                    style: TextStyle(
                      fontSize: responsivo.diagonalPantalla(1.7),
                    ),
                  ),
                  TextSpan(
                    text: 'Mobike.',
                    style: TextStyle(
                      color: Color.fromRGBO(108, 99, 255, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: responsivo.diagonalPantalla(1.7),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Divider(),
            FormularioCrearClave(),
          ],
        ),
      ),
    );
  }
}