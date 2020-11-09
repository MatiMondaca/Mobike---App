import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobike/home/homeScreen.dart';
import 'loginRegister/login/loginScreen.dart';

Future<void> main() async {
  //ERROR AQUI - MAIN
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Mobike());
}

class Mobike extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Autenticacion(),
      color: Colors.blue,
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
            return HomePage();
          }
          return SingInPage();
        });
  }
}
