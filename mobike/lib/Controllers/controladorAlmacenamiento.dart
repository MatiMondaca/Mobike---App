import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobike/localizador.dart';
import 'package:mobike/Models/modeloUsuario.dart';
import 'package:mobike/Controllers/controladorFirebase.dart';

class ControladorAlmacenamiento {
  
  FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: "gs://profiletutorial-c5ed1.appspot.com");
  
  ControladorFirebase _authCon = locator.get<ControladorFirebase>();

  Future<String> uploadFile(File file) async {
    ModeloUsuario user =  _authCon.obtenerUsuario();
    var userId = user.uid;

    var storageRef = _storage.ref().child("user/profile/$userId");
    var uploadTask = storageRef.putFile(file);
    var completedTask = await uploadTask;
    String downloadUrl = await completedTask.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> getUserProfileImage(String uid) async {
    return await _storage.ref().child("user/profile/$uid").getDownloadURL();
  }
}
