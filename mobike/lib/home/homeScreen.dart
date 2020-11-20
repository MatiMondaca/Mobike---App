import 'package:flutter/material.dart';
import 'package:mobike/Assist/AssistPage.dart';

import 'settingsSreen/settingScreen.dart';
import 'userProfileScreen/userProfile.dart';
import '../const.dart';
import 'map/mapScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: appbar,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: IconButton(
            icon: Icon(Icons.person),
            color: Colors.black,
            iconSize: 40.0,
            onPressed: () {
              _pushPage(context, UserProfile());
              //_pushPage(context, UserProfile());
            },
          ),
        ),

        ///
        /// ACTIONS
        ///
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(Icons.settings),
              color: Colors.black,
              iconSize: 40.0,
              onPressed: () {
                _pushPage(context, SettingsScreen());
              },
            ),
          ),
        ],
      ),

      ///
      /// BODY
      ///
      body: WillPopScope(
        onWillPop: _salirApp,
        child: SafeArea(
          child: MapMobike(),
        ),
      ),

      ///
      /// FLOATING BUTTON
      ///
      floatingActionButton: Container(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.search),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      ///
      /// NAVIGATION BAR
      ///
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 75,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: Container(
                    child: IconButton(
                  iconSize: 60.0,
                  icon: Image.asset("assets/alerta.png"),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AssistPage(),
                      ),
                    );
                  },
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 60.0),
                child: Container(
                    child: IconButton(
                  iconSize: 60.0,
                  icon: Image.asset("assets/alerta.png"),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AssistPage(),
                      ),
                    );
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Metodo para la alerta al momento de presionar el boton back
  Future<bool> _salirApp() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return cuerpoAlerta(context);
      },
    );
  }

  // Metodo para pasar a otra ventana
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
