import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobike/utils/responsivo.dart';

class VentanaCompeletado extends StatelessWidget {
  const VentanaCompeletado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsivo = Responsivo.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "¡Lo  lograste!",
            style: TextStyle(
              color: Color.fromRGBO(108, 99, 255, 1),
              fontSize: responsivo.diagonalPantalla(4),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Tu cuenta se ha creado con exito, Muchas gracias por ser parte de Mobike.",
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SvgPicture.asset(
              'assets/svg/completado.svg',
              height: 500,
            ),
          ),
        ],
      ),
    );
  }
}
