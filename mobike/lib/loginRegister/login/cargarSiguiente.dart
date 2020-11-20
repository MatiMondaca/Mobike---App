import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CargarPag extends StatelessWidget {
  const CargarPag({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitFadingCircle(
          color: Colors.black,
          size: 60.0,
        ),
      ),
    );
  }
}
