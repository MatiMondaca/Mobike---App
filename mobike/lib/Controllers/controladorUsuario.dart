import 'package:firebase_database/firebase_database.dart';
import 'package:mobike/views/Registro/VentanaTarjetaCredito/tarjetaScreen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:mobike/Models/modeloUsuario.dart';
import 'dart:io';

import 'package:mobike/localizador.dart';

import 'package:mobike/Controllers/controladorFirebase.dart';
import 'package:mobike/Controllers/controladorAlmacenamiento.dart';

class UserController extends ControllerMVC {
  ModeloUsuario _currentUser;
  ModeloUsuario _registrarusuario = ModeloUsuario();
  TarjetaCredito _tarjetaCredito = TarjetaCredito();
  ControladorFirebase _authCon = locator.get<ControladorFirebase>();
  ControladorAlmacenamiento _storageRepo =
      locator.get<ControladorAlmacenamiento>();
  static DatabaseReference usuarios =
      FirebaseDatabase.instance.reference().child("usuarios");
  var init;

  UserController() {
    init = initUser();
  }

  ModeloUsuario initUser() {
    _currentUser = _authCon.obtenerUsuario();
    return _currentUser;
  }

  ModeloUsuario get currentUser => _currentUser;
  ModeloUsuario get registrarUsuario => _registrarusuario;
  TarjetaCredito get tarjeta => _tarjetaCredito;

  Future<void> uploadProfilePicture(File image) async {
    _currentUser.avatarUrl = await _storageRepo.uploadFile(image);
  }

  Future<String> getDownloadUrl() async {
    return await _storageRepo.getUserProfileImage(currentUser.uid);
  }

  Future<void> signInWithEmailAndPassword(
      {String email, String password}) async {
    _currentUser =
        await _authCon.entrarConEmail(email: email, password: password);

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

  void datosUsuario({
    String rut,
    String nombre,
    String comuna,
    String direccion,
    String correo,
    String clave,
    String celular,
    String numTarjeta,
  }) {
    // RUT
    (this._registrarusuario.getRut == null ||
            this._registrarusuario.getRut == '' ||
            this._registrarusuario.getRut != rut)
        ? this._registrarusuario.setRut = rut
        : print(_registrarusuario.getRut);

    print('aaaaaaaaaaa ${_registrarusuario.getRut}');

    // NOMBRE + APELLIDO
    (this._registrarusuario.getDisplayName == null ||
            this._registrarusuario.getDisplayName == '' ||
            this._registrarusuario.getDisplayName != nombre)
        ? this._registrarusuario.setDisplayName = nombre
        : print(_registrarusuario.getDisplayName);

    // COMUNA
    (this._registrarusuario.getComuna == null ||
            this._registrarusuario.getComuna == '' ||
            this._registrarusuario.getComuna != comuna)
        ? this._registrarusuario.setComuna = comuna
        : print(_registrarusuario.getComuna);

    // DIRECCION
    (this._registrarusuario.getDireccion == null ||
            this._registrarusuario.getDireccion == '' ||
            this._registrarusuario.getDireccion != direccion)
        ? this._registrarusuario.setDireccion = direccion
        : print(_registrarusuario.getDireccion);

    // CORREO
    (this._registrarusuario.getCorreo == null ||
            this._registrarusuario.getCorreo == '' ||
            this._registrarusuario.getCorreo != correo)
        ? this._registrarusuario.setCorreo = correo
        : print(_registrarusuario.getCorreo);

    // CLAVE
    (this._registrarusuario.getClave == null ||
            this._registrarusuario.getClave == '' ||
            this._registrarusuario.getClave != clave)
        ? this._registrarusuario.setClave = clave
        : print(_registrarusuario.getClave);

    // CELULAR
    (this._registrarusuario.getCelular == null ||
            this._registrarusuario.getCelular == '' ||
            this._registrarusuario.getCelular != celular)
        ? this._registrarusuario.setCelular = celular
        : print(_registrarusuario.getCelular);
  }

  Future<void> getUserData(String id) async {
    await usuarios.child(id).once().then((DataSnapshot snapshot) {
      var keys = snapshot.value.keys;
      var data = snapshot.value;
      _currentUser.setRut = data['rut'];
      _currentUser.setDisplayName = data['nombre'];
      _currentUser.setAvatarUrl = getDownloadUrl() as String;
      _currentUser.setComuna = data['comuna'];
      _currentUser.setDireccion = data['direccion'];
      _currentUser.setCorreo = data['correo'];

      for (var key in keys) {
        print('datos : ${key} ${data[key]}');
      }

      print(_currentUser.getAvatarUrl);
    });
  }
}
