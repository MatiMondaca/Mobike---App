import 'package:mobike/Models/tarjetaCreditoModel.dart';
import '../Models/tarjetaCreditoModel.dart';

class ControladorTarjeta {
  var init;
  ModeloTarjetaCredito _tarjetaCredito = ModeloTarjetaCredito();

  ControladorTarjeta() {
    init = initTarjeta();
  }

  ModeloTarjetaCredito initTarjeta() {
    _tarjetaCredito.numeroTarjeta = '';
    return _tarjetaCredito;
  }

  String get getNumero => _tarjetaCredito.numeroTarjeta;

  set setNumero(String numero) => _tarjetaCredito.numeroTarjeta = numero;
}
