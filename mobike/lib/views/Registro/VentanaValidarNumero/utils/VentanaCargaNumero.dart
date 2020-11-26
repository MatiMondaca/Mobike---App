import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VentanaCargaNumero extends StatelessWidget {
  const VentanaCargaNumero({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset('assets/svg/correcto.svg'),
      ),
    );
  }
}
