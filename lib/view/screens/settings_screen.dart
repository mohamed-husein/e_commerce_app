import 'package:e_commerce_app/logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            AuthController().signOut();
          },
          child: const Text('SignOut'),
        ),
      ),
    );
  }
}
