// return Unfocuser(
//       child: WillPopScope(
//         onWillPop: salirApp,
//         child: SafeArea(
//           child: cargar
//               ? CargarPag()
//               : Scaffold(
//                   backgroundColor: Colors.white,
//                   body: SingleChildScrollView(
//                     child: Form(
//                       key: _formKeyLogin,
//                       child: Container(
//                         child: Column(
//                           children: [
//                             ///
//                             /// Titulo 'Mobike'
//                             ///
//                             Title(
//                               color: Colors.black,
//                               child: Text(
//                                 "MoBike",
//                                 style: TextStyle(
//                                   fontSize: 60.0,
//                                   fontWeight: FontWeight.normal,
//                                 ),
//                               ),
//                             ),

//                             ///
//                             /// METODOS => CORREO - CONTRASEÑA
//                             /// TextFormField convertidos en metodos para orderar el código
//                             ///
//                             Padding(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 10.0, horizontal: 20.0),
//                               child: buildCorreo(context),
//                             ), // Correo
//                             Padding(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 10.0, horizontal: 20.0),
//                               child: buildPassword(context),
//                             ), // Contraseña

//                             Padding(
//                               padding: EdgeInsets.only(
//                                   top: 10.0, bottom: 10.0, right: 20.0),
//                               child: Container(
//                                 width: double.infinity,
//                                 child: InkWell(
//                                   onTap: () {
//                                     _pushPage(context, RecuperarClave());
//                                   },
//                                   child: Text(
//                                     "¿Olvidó su contraseña?",
//                                     textAlign: TextAlign.right,
//                                   ),
//                                 ),
//                               ),
//                             ),

//                             ///
//                             /// Botón Inicio de Sesión
//                             ///
//                             RaisedButton(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 25,
//                                 vertical: 10,
//                               ),
//                               color: Colors.blue,
//                               onPressed: () async {
//                                 if (_formKeyLogin.currentState.validate()) {
//                                   if (validarCorreo(_emailController.text)) {
//                                     setState(() => cargar = true);
//                                     try {
//                                       final user = await AutenticacionServicio
//                                           .entrarConEmail(
//                                         email: _emailController.text,
//                                         password: _passController.text,
//                                       );

//                                       print('paso 1 ---');
//                                       print(user);
//                                       if (user != null) {
//                                         Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                               builder: (context) => HomePage()),
//                                         );
//                                         print("Inicio de sesión correcto");
//                                       } else {
//                                         setState(() => cargar = false);
//                                       }
//                                     } on FirebaseAuthException catch (e) {
//                                       if (e.code == 'user-not-found') {
//                                         return Fluttertoast.showToast(
//                                           msg: "Cuenta no encontrada",
//                                           toastLength: Toast.LENGTH_SHORT,
//                                           gravity: ToastGravity.BOTTOM,
//                                           timeInSecForIosWeb: 1,
//                                           backgroundColor: Colors.red,
//                                           textColor: Colors.white,
//                                           fontSize: 16.0,
//                                         );
//                                       }
//                                     }
//                                   } else {
//                                     return Fluttertoast.showToast(
//                                       msg: "Correo invalido",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.BOTTOM,
//                                       timeInSecForIosWeb: 1,
//                                       backgroundColor: Colors.red,
//                                       textColor: Colors.white,
//                                       fontSize: 16.0,
//                                     );
//                                   }
//                                 }
//                               },
//                               child: Text(
//                                 "Iniciar Sesión",
//                                 style: TextStyle(
//                                     fontSize: 20, color: Colors.white),
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                             ),

//                             ///
//                             /// Botón Registrarse
//                             ///
//                             FlatButton(
//                               onPressed: () {
//                                 pagRegistro.numero = '';
//                                 _popPage(context);
//                                 _pushPage(context, pagRegistro);
//                               },
//                               child: Text("Registrarse"),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//         ),
//       ),
//     );