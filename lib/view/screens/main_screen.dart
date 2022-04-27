import 'package:e_commerce_app/logic/controller/main_controller.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const TextStyle textStyle=TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);

class MainScreen extends StatelessWidget {
  final controller=Get.find<MainController>();

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
          body:IndexedStack(
            children: controller.screens,
            index: controller.currentIndex.value,
          ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.shifting,
          items: controller.bottomNavItem,
          selectedItemColor: mainColor,
          unselectedItemColor: Colors.black,
          currentIndex: controller.currentIndex.value,
          onTap: (index){
            controller.currentIndex.value=index;
          },

        ),

      );
    });
  }
}
