import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'autenticacion/auth.dart';

class SingInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            TextField(
              controller: passController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Contraseña",
              ),
            ),
            RaisedButton(
              onPressed: () {
                context.read<AutenticacionServicio>().signIn(
                      email: emailController.text.trim(),
                      password: passController.text.trim(),
                    );
              },
              child: Text("Logeado"),
            ),
          ],
        ),
      ),
    );
  }
}
