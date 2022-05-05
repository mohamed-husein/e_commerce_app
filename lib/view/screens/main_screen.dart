import 'package:e_commerce_app/logic/controller/main_controller.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomNavItem {
  final String icon;


  BottomNavItem({required this.icon,});
}

const TextStyle textStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);

class MainScreen extends StatelessWidget {
  final List<BottomNavItem> selectedItems = [
    BottomNavItem(icon: 'assets/icons/home-solid.svg',),
    BottomNavItem(icon: 'assets/icons/apps-solid.svg',),
    BottomNavItem(icon: 'assets/icons/search-solid.svg',),
    BottomNavItem(icon: 'assets/icons/heart-solid.svg',),
  ];
  final List<BottomNavItem> unselectedItems = [
    BottomNavItem(icon: 'assets/icons/unselected_home.svg', ),
    BottomNavItem(icon: 'assets/icons/unselected_apps.svg', ),
    BottomNavItem(icon: 'assets/icons/search.svg', ),
    BottomNavItem(icon: 'assets/icons/unselected_heart.svg',),
  ];
  final controller = Get.find<MainController>();

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          children: controller.screens,
          index: controller.currentIndex.value,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20, right: 16, left: 16),
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey.shade100,
            ),
            child: Center(
              child: Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: List.generate(selectedItems.length, (index) {
                  return InkWell(
                    onTap: () {
                      controller.selectItem(index);
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                      height: 22,
                      child: SvgPicture.asset(
                        controller.currentIndex.value == index
                            ? selectedItems[index].icon
                            : unselectedItems[index].icon,
                        height: 20,
                        width: 20,
                        color: controller.currentIndex.value == index
                            ? mainColor
                            : Colors.black,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      );
    });
  }
}

//
