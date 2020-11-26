import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobike/views/Registro/VentanaValidarNumero/mainValidadNumero.dart';

import 'localizador.dart';
import 'utils/theme.dart';

Future<void> main() async {
  //ERROR AQUI - MAIN
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServices();

  runApp(Mobike());
}

class Mobike extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // // to hide only bottom bar:
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    // // to hide only status bar:
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    // // to hide both:
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: Autenticacion(),
    );
  }
}

class Autenticacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return ValidarCelular();
        }
        return ValidarCelular();
      },
    );
  }
}
