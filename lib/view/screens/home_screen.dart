import 'package:e_commerce_app/logic/controller/auth_controller.dart';
import 'package:e_commerce_app/logic/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {


  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        body: Center(
          child: MaterialButton(
            onPressed: () {
            },
            child: Text('change'),
          ),
        ),
      );

  }
}
