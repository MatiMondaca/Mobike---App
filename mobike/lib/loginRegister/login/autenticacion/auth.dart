import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class AutenticacionServicio {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static DatabaseReference usuarioRef =
      FirebaseDatabase.instance.reference().child("usuarios");

  static entrarConEmail({String email, String password}) async {
    try {
      final res = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User user = res.user;
      return user;
    } catch (error) {
      Fluttertoast.showToast(
          msg: "Correo y/o contraseña invalidos",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  static cerrarSesion() {
    print("Salir");
    return _auth.signOut();
  }

  static resetPassword({String email}) async {
    try {
      print(email);

      await _auth.sendPasswordResetEmail(email: email).then(
            (value) => print("Correo enviado"),
          );
    } on FirebaseAuthException catch (e) {
      print(e.code);
      print("Error: ${e.message}");
    }
  }

  static void registrarUsuario(
      String rut,
      String nombre,
      String apellido,
      String comuna,
      int numTarjeta,
      String direccion,
      int numCasa,
      String correo,
      String clave,
      int telefono) async {
    final User firebaseUser = (await _auth.createUserWithEmailAndPassword(
            email: correo, password: clave))
        .user;

    if (firebaseUser != null) {
      try {
        Map datosUsuario = {
          "rut": rut,
          "nombre": nombre,
          "apellido": apellido,
          "comuna": comuna,
          "numero_tarjeta": numTarjeta,
          "direccion": direccion,
          "numero_casa": numCasa,
          "correo": correo,
          "telefono": telefono,
        };
        usuarioRef.child(firebaseUser.uid).set(datosUsuario);
      } on FirebaseException catch (e) {
        print(e);
      }
    }
  }
}
