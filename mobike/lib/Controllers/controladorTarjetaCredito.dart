import 'package:mobike/Models/tarjetaCreditoModel.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:mobike/Models/modeloUsuario.dart';
import 'dart:io';

import 'package:mobike/localizador.dart';

import 'package:mobike/Controllers/controladorFirebase.dart';
import 'package:mobike/Controllers/controladorAlmacenamiento.dart';

class ControladorTarjeta {
  int numero;
  ModeloTarjetaCredito _tarjetaCredito;

  num get getNumero => numero;

  set setNumero(num numero) => this.numero = numero;
}
