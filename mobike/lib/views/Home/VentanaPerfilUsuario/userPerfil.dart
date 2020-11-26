import 'dart:io';

import 'package:mobike/localizador.dart';
import 'package:mobike/Models/modeloUsuario.dart';
import 'package:mobike/Controllers/controladorUsuario.dart';
import 'package:mobike/views/Home/VentanaPerfilUsuario/avatar.dart';
import 'package:mobike/views/Home/VentanaPerfilUsuario/manage_profile_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  static String route = "profile-view";

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ModeloUsuario _currentUser = locator.get<UserController>().currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(108, 99, 255, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Avatar(
                    avatarUrl: _currentUser?.avatarUrl,
                    onTap: () async {
                      File image = await ImagePicker.pickImage(
                          source: ImageSource.gallery);

                      await locator
                          .get<UserController>()
                          .uploadProfilePicture(image);

                      setState(() {});
                    },
                  ),
                  Text(
                      "Hi ${_currentUser.displayName ?? 'nice to see you here.'}", style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ManageProfileInformationWidget(
              currentUser: _currentUser,
            ),
          )
        ],
      ),
    );
  }
}
