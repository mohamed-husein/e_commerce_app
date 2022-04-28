import 'package:e_commerce_app/logic/controller/main_controller.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/contant.dart';

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
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/menu.svg"),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/Location.svg"),
              const SizedBox(width: defaultPadding / 2),
              Text(
                "15/2 New Texas",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset("assets/icons/Notification.svg"),
              onPressed: () {},
            ),
          ],
        ),
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
