import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobike/loginRegister/login/autenticacion/auth.dart';
import 'userProfileScreen/userProfile.dart';
import '../const.dart';
import 'map/mapScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

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
            iconSize: 30.0,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UserProfile(),
                ),
              );
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
              iconSize: 30.0,
              onPressed: () {
                context.read<AutenticacionServicio>().signOut();
              },
            ),
          ),
        ],
      ),

      ///
      /// BODY
      ///
      body: SafeArea(
        child: FlutterMapMobike(),
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
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }
}
