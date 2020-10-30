

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'autenticacion/auth.dart';

class SingInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextStyle estilo = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
  

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          
         
        mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Padding(padding: EdgeInsets.all(30.0), child:
            
            Title(color: Colors.black, child: Text("MoBike",style:  TextStyle(fontSize: 90.0,fontWeight: FontWeight.normal)))
            ),

            Padding(padding: EdgeInsets.all(10.0), child: 
            TextField(
            
         
              

              textAlign: TextAlign.center,
              
             
              obscureText: false,
              style: estilo,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              labelText: "Email",
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0,),),),
                     
            ),),
            Padding(padding: EdgeInsets.all(10.0), child: 
            TextField(
              
               textAlign: TextAlign.center,
              controller: passController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              style: estilo,
              
              decoration: InputDecoration(
              
              
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                labelText: "Contraseña",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                    isDense: true,
              ),
            ),),
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                context.read<AutenticacionServicio>().signIn(
                      email: emailController.text.trim(),
                      password: passController.text.trim(),
                    );
              },
              child: Text("Iniciar"),
            ),
          ],
        ),
      ),
    );
  }
}
