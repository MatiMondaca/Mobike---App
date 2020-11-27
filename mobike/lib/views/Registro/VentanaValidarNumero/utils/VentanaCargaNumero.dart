import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobike/utils/responsivo.dart';

class VentanaCargaNumero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsivo = Responsivo.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "¡Validado con Exito!",
            style: TextStyle(
              color: Color.fromRGBO(108, 99, 255, 1),
              fontSize: responsivo.diagonalPantalla(4),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SvgPicture.asset(
              'assets/svg/correcto.svg',
              height: 500,
            ),
          ),
        ],
      ),
    );
  }
}
