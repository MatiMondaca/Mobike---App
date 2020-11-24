import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_multi_formatter/formatters/credit_card_number_input_formatter.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:mobike/const.dart';

import 'package:mobike/loginRegister/register/tarjetaCredito/validarTarjeta.dart';


class TarjetaCredito extends StatefulWidget {
  TarjetaCredito({this.numTarjeta});
  final String numTarjeta;

  @override
  _TarjetaCreditoState createState() => _TarjetaCreditoState();
}

class _TarjetaCreditoState extends State<TarjetaCredito> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _numerotarjeta = TextEditingController();

  String numeroTarjeta = "";
  String nombreTitular = "";
  String fechaExpiracion = "";
  String codigoVerificacion = "";
  bool mostrarReverso = false;

  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? mostrarReverso = true : mostrarReverso = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: salirApp,
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        body: SafeArea(
          child: Column(
            children: [
              buildTarjetaCredito(),
              buildTextoCampos(),
              Expanded(
                child: Unfocuser(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ///
                          /// Numero Tarjeta de credito
                          ///
                          buildNumTarjeta(),

                          ///
                          /// Fecha Expiracion - CVV
                          ///
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20, top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ///
                                /// Expiracion de la tarjeta
                                ///
                                buildFechaExpiracion(),

                                ///
                                /// CVV
                                ///
                                buildCVV(),
                              ],
                            ),
                          ),

                          ///
                          /// Nombre Titular
                          ///
                          buildNombreTitular(),

                          ///
                          /// Boton Agregar tarjeta
                          ///
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5.0,
                            ),
                            child: ValidarTarjeta(
                              formKey: _formKey,
                              numerotarjeta: _numerotarjeta,
                            ),
                          ),

                          ///
                          /// Boton volver
                          ///
                          FlatButton(
                            onPressed: () {
                              _popPage(context);
                            },
                            child: Text(
                              "Quiero volver",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontFamily: 'Century-Gothic',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///
  /// METODOS - VALIDACIONES
  ///

  // CAMPO NOMBRE TITULAR
  Container buildNombreTitular() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: 18.0,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(),
            ),
            labelText: 'Nombre Titular',
          ),
          maxLines: 1,
          maxLengthEnforced: true,
          maxLength: 25,

          // Cambio en la tarjeta de credito
          onChanged: (nom) {
            setState(() {
              nombreTitular = nom;
            });
          },
          // Validacion del campo
          validator: (value) {
            if (value.isEmpty || value == null || value.length > 25) {
              return 'Campo obligatorio';
            }
            return null;
          },
        ),
      ),
    );
  }

  // CAMPO CODIGO DE VERIFICACIÓN
  Container buildCVV() {
    return Container(
      width: 185,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 20.0,
        ),
        child: TextFormField(
          inputFormatters: [CreditCardCvcInputFormatter()],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(),
            ),
            labelText: 'CVV',
          ),
          maxLines: 1,
          maxLength: 3,
          // Cambio en la tarjeta de credito
          onChanged: (cod) {
            setState(() {
              codigoVerificacion = cod;
            });
          },
          focusNode: _focusNode,
          // Validacion del campo
          validator: (value) {
            if (value.isEmpty || value == null) {
              return 'Campo obligatorio';
            }
            return null;
          },
        ),
      ),
    );
  }

  // CAMPO FECHA DE EXPIRACIÓN
  Container buildFechaExpiracion() {
    return Container(
      width: 220,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 15.0,
        ),
        child: TextFormField(
          inputFormatters: [CreditCardExpirationDateFormatter()],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(),
            ),
            labelText: 'Fecha Expiración',
          ),
          maxLines: 1,
          maxLength: 5,
          // Cambio en la tarjeta de credito
          onChanged: (fecha) {
            setState(() {
              fechaExpiracion = fecha;
            });
          },
          // Validacion del campo
          validator: (value) {
            if (value.isEmpty || value == null) {
              return 'Campo obligatorio';
            }
            return null;
          },
        ),
      ),
    );
  }

  // CAMPO NUMERO DE TARJETA
  Container buildNumTarjeta() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, bottom: 10.0, top: 10.0),
        child: TextFormField(
          autofocus: true,
          inputFormatters: [CreditCardNumberInputFormatter()],
          controller: _numerotarjeta,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(),
            ),
            labelText: 'Número de tarjeta',
          ),
          maxLines: 1,
          maxLength: 19,

          // Cambio en la tarjeta de credito
          onChanged: (nume) {
            setState(() {
              numeroTarjeta = nume;
            });
          },
          // Validacion del campo
          validator: (value) {
            if (value.isEmpty || value == null || value.length != 19) {
              return 'Campo obligatorio';
            }
            return null;
          },
        ),
      ),
    );
  }

  // DISEÑO TARJETA CREDITO - TEXTO DEBAJO
  Padding buildTextoCampos() {
    return Padding(
      padding: EdgeInsets.only(
        top: 15.0,
        bottom: 10.0,
      ),
      child: Text(
        "Complete todos los campos",
        style: TextStyle(fontFamily: 'Century-Gothic', fontSize: 17),
      ),
    );
  }

  Padding buildTarjetaCredito() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0, top: 20.0),
      child: CreditCard(
        showShadow: true,
        height: 195,
        frontBackground: CardBackgrounds.black,
        backBackground: CardBackgrounds.white,
        cardNumber: numeroTarjeta,
        cardHolderName: nombreTitular,
        cardExpiry: fechaExpiracion,
        cvv: codigoVerificacion,
        showBackSide: mostrarReverso,
        bankName: 'Tarjeta de Crédito',
      ),
    );
  }

  // METODO POP
  void _popPage(BuildContext context) {
    Navigator.of(context).pop();
  }

  // METODO PARA CONFIRMAR SALIDA DE LA APLICACIÓN
  Future<bool> salirApp() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return cuerpoAlerta(context);
      },
    );
  }
}
