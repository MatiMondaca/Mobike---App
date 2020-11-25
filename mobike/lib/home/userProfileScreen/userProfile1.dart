import 'package:flutter/material.dart';
import 'package:mobike/Models/modeloUsuario.dart';
import 'package:mobike/home/userProfileScreen/avatar/avatar.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  ModeloUsuario _usuarioActual;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Avatar(avatarUrl: _usuarioActual.avatarUrl,onTap: (){
                          
                        },),
                        
                        Text(
                      "Hi ${_usuarioActual?.displayName ?? 'nice to see you here.'}"),

                      ],




                    ),
          )
          ),
          Expanded(
            flex: 2,
            
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(hintText: "Username"),
                  ),
                  SizedBox(height: 20.0,),
                  Expanded(child: Column(
                    children: <Widget>[
                      Text("Editar Contraseña", style: Theme.of(context).textTheme.headline4,),
                      
                          TextFormField(
                            decoration: InputDecoration(hintText: "Password"),
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(hintText: "New Password"),
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(hintText: "Repeat Password"),
                          )



                    ],
                  ))


                ],

              ),


            )
            
            )

        ],
      ),
    );
  }
}
