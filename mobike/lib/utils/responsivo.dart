import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart' show required;
import 'dart:math' as math;

class Responsivo {
  final double width, height, inch;

  Responsivo({
    @required this.width,
    @required this.height,
    @required this.inch,
  });

  factory Responsivo.of(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final size = data.size;

    final inch = math.sqrt(math.pow(size.width, 2) + math.pow(size.height, 2));
    return Responsivo(width: size.width, height: size.height, inch: inch);
  }

  double anchoPantalla(double ancho) {
    return this.width * ancho / 100;
  }

  double altoPantalla(double alto) {
    return this.height * alto / 100;
  }

  double diagonalPantalla(double diagonal) {
    return this.inch * diagonal / 100;
  }
}
