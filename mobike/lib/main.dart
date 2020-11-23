import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobike/home/homeScreen.dart';
import 'package:mobike/loginRegister/login/loginScreen.dart';

Future<void> main() async {
  //ERROR AQUI - MAIN
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
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
          print(snapshot.hasData);
          print(snapshot.data);
          return HomePage();
        }
        return SingInPage();
      },
    );
  }
}
