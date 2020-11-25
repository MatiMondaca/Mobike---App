import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobike/Models/modeloUsuario.dart';

class ControladorFirebase {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  ControladorFirebase();
  // por que esta esto aqui?
  static DatabaseReference usuarioRef =
      FirebaseDatabase.instance.reference().child("usuarios");
  //
  entrarConEmail({String email, String password}) async {
    try {
      final res = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User user = res.user;
      return user;
    } catch (error) {
      // Fluttertoast.showToast(
      //     msg: "Correo y/o contraseña invalidos",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }

// metodo para cerrar sesion
  cerrarSesion() {
    print("Salir");
    return _auth.signOut();
  }

  resetPassword({String email}) async {
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

  Future<bool> validarContrasena(String password) async {
    var usuarioFirebase = _auth.currentUser;

    var authCredentials = EmailAuthProvider.credential(
        email: usuarioFirebase.email, password: password);
    try {
      var authResult =
          await usuarioFirebase.reauthenticateWithCredential(authCredentials);
      return authResult.user != null;
    } catch (e) {
      print(e);
      return false;
    }
  }

  ModeloUsuario obtenerUsuario() {
    var usuarioFirebase = _auth.currentUser;
    return ModeloUsuario(
      usuarioFirebase?.uid,
      displayName: usuarioFirebase?.displayName,
    );
  }

  void actualizarDisplayNombre(String nombre) {
    var user = _auth.currentUser;

    user.updateProfile(displayName: user.displayName);
  }

  void actualizarContrasena(String password) {
    var firebaseUser = _auth.currentUser;
    firebaseUser.updatePassword(password);
  }

  void registrarUsuario(
      String rut,
      String nombre,
      String apellido,
      String comuna,
      int numTarjeta,
      String direccion,
      String correo,
      String clave,
      int telefono,
      [String avatarUrl]) async {
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
          "correo": correo,
          "telefono": telefono,
          "avatar": avatarUrl,
        };
        usuarioRef.child(firebaseUser.uid).set(datosUsuario);
      } on FirebaseException catch (e) {
        print(e);
      }
    }
  }
}
