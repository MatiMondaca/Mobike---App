import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:mobike/Models/modeloUsuario.dart';
import 'dart:io';

import 'package:mobike/localizador.dart';

import 'package:mobike/Controllers/controladorFirebase.dart';
import 'package:mobike/Controllers/controladorAlmacenamiento.dart';

class UserController extends ControllerMVC {
  ModeloUsuario _currentUser;
  ControladorFirebase _authCon = locator.get<ControladorFirebase>();
  ControladorAlmacenamiento _storageRepo = locator.get<ControladorAlmacenamiento>();
  var init;

  UserController() {
    init = initUser();
  }

  ModeloUsuario initUser()  {
    _currentUser =  _authCon.obtenerUsuario();
    return _currentUser;
  }

  ModeloUsuario get currentUser => _currentUser;

  Future<void> uploadProfilePicture(File image) async {
    _currentUser.avatarUrl = await _storageRepo.uploadFile(image);
  }

  Future<String> getDownloadUrl() async {
    return await _storageRepo.getUserProfileImage(currentUser.uid);
  }

  Future<void> signInWithEmailAndPassword(
      {String email, String password}) async {
    _currentUser = await _authCon.entrarConEmail(
        email: email, password: password);

    _currentUser.avatarUrl = await getDownloadUrl();
  }

  void updateDisplayName(String displayName) {
    _currentUser.displayName = displayName;
    _authCon.actualizarDisplayNombre(displayName);
  }

  Future<bool> validateCurrentPassword(String password) async {
    return await _authCon.validarContrasena(password);
  }

  void updateUserPassword(String password) {
    _authCon.actualizarContrasena(password);
  }
}
