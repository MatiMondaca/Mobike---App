import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';

class AutenticacionServicio {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static entrarConEmail({String email, String password}) async {
    try {
      final res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final User user = res.user;
      print('paso 2');
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

    // TODO
  }

  static cerrarSesion() {
    return _auth.signOut();
  }

  
}

