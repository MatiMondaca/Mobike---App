// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_multi_formatter/utils/unfocuser.dart';
// import 'package:mobike/loginRegister/register/crearClave/validadorClave.dart';

// import '../../../const.dart';

// bool _verContrasenna = false;

// @override
// void initState() {
//   _verContrasenna = false;
// }

// class CrearClave extends StatefulWidget {
//   @override
//   _CrearClaveState createState() => _CrearClaveState();
// }

// class _CrearClaveState extends State<CrearClave> {
//   TextEditingController _contrasennaController = TextEditingController();
//   TextEditingController _contrasennaRepeatController = TextEditingController();
//   EditTxTValid validadorClave = EditTxTValid();

//   GlobalKey<FormState> _validarCampoClave = GlobalKey<FormState>();

//   final FocusNode _segundaClave = FocusNode();

//   @override
//   Widget build(BuildContext context) {
//     return Unfocuser(
//       child: WillPopScope(
//         onWillPop: salirApp,
//         child: Scaffold(
//           body: SafeArea(
//             child: Column(
//               children: [
//                 buildTitulo(),
//                 buildSubTitulo(),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Form(
//                       key: _validarCampoClave,
//                       child: Column(
//                         children: [
//                           ///
//                           /// Titulo - Subtitulo
//                           ///

//                           ///
//                           /// Primera Clave
//                           ///
//                           buildClave(context),

//                           ///
//                           /// Segunda Clave
//                           ///
//                           buildClaveRepeat(),

//                           ///
//                           /// Validadores
//                           ///
//                           validadorClave,

//                           ///
//                           /// Boton para crear la cuenta
//                           ///
//                           Padding(
//                             padding: const EdgeInsets.only(top: 20),
//                             child: RaisedButton(
//                               textColor: Colors.white,
//                               color: Colors.green,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 30,
//                                   vertical: 15,
//                                 ),
//                                 child: Text(
//                                   "Crear mi cuenta",
//                                   style: TextStyle(
//                                       fontFamily: 'Century-Gothic',
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               onPressed: () {
//                                 if (validadorClave.cbxMinCaracter &&
//                                     validadorClave.cbxMayus &&
//                                     validadorClave.cbxNumero &&
//                                     _contrasennaController.text ==
//                                         _contrasennaRepeatController.text) {
//                                   return print("Contraseña correcta");
//                                 } else {
//                                   return print("Error");
//                                 }
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Padding buildTitulo() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 40),
//       child: Text(
//         "Crea tu contraseña",
//         style: TextStyle(
//           fontFamily: 'Century-Gothic',
//           fontSize: 30.0,
//         ),
//       ),
//     );
//   }

//   Padding buildSubTitulo() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 20),
//       child: Text(
//         "¡Estas un paso mas cerca de hacer el cambio!",
//         style: TextStyle(fontStyle: FontStyle.italic),
//       ),
//     );
//   }

//   Padding buildClave(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 25.0, left: 25.0, top: 40.0),
//       child: TextFormField(
//         keyboardType: TextInputType.visiblePassword,
//         obscureText: !_verContrasenna,
//         controller: _contrasennaController,
//         textInputAction: TextInputAction.next,
//         textAlign: TextAlign.left,
//         maxLines: 1,
//         minLines: 1,
//         style: TextStyle(fontSize: 20),
//         decoration: InputDecoration(
//           labelText: '  Cree una contraseña',
//           labelStyle: TextStyle(fontSize: 18, fontFamily: 'Century-Gothic'),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(25),
//           ),
//           suffixIcon: IconButton(
//             icon: _verContrasenna
//                 ? Icon(Icons.visibility)
//                 : Icon(Icons.visibility_off),
//             onPressed: () {
//               setState(() {
//                 _verContrasenna = !_verContrasenna;
//               });
//             },
//           ),
//         ),
//         onChanged: (txt) {
//           validadorClave.validation(_contrasennaController.text);
//         },
//         onFieldSubmitted: (value) {
//           FocusScope.of(context).requestFocus(_segundaClave);
//         },
//       ),
//     );
//   }

//   Padding buildClaveRepeat() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
//       child: TextFormField(
//         keyboardType: TextInputType.visiblePassword,
//         obscureText: true,
//         controller: _contrasennaRepeatController,
//         textInputAction: TextInputAction.done,
//         textAlign: TextAlign.left,
//         maxLines: 1,
//         minLines: 1,
//         focusNode: _segundaClave,
//         style: TextStyle(fontSize: 20),
//         decoration: InputDecoration(
//           labelText: '  Repita la contraseña',
//           labelStyle: TextStyle(fontSize: 18, fontFamily: 'Century-Gothic'),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(25),
//           ),
//           suffixIcon: IconButton(
//             icon: _verContrasenna
//                 ? Icon(Icons.visibility)
//                 : Icon(Icons.visibility_off),
//             onPressed: () {
//               setState(() {
//                 _verContrasenna = !_verContrasenna;
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   // METODO PARA CONFIRMAR SALIDA DE LA APLICACIÓN
//   Future<bool> salirApp() {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return cuerpoAlerta(context);
//       },
//     );
//   }
// }
