import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobike/home/homeScreen.dart';
import 'package:provider/provider.dart';
import 'loginRegister/login/autenticacion/auth.dart';
import 'loginRegister/login/loginScreen.dart';

void main() async { //ERROR AQUI - MAIN
  runApp(Mobike());
}

class Mobike extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AutenticacionServicio>(
          create: (_) => AutenticacionServicio(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AutenticacionServicio>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
        home: Autenticacion(),
      ),
    );
  }
}

class Autenticacion extends StatelessWidget {
  const Autenticacion({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomePage();
    }
    return SingInPage();
  }
}
