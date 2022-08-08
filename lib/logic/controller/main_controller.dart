import 'package:e_commerce_app/utils/icon_broken.dart';
import 'package:e_commerce_app/view/screens/all_product_screen.dart';
import 'package:e_commerce_app/view/screens/category_items.dart';
import 'package:e_commerce_app/view/screens/favorites_screen.dart';
import 'package:e_commerce_app/view/screens/home_screen.dart';
import 'package:e_commerce_app/view/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screens/main_screen.dart';

class MainController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt currentIndex = 0.obs;
  void openDrawer(){
    scaffoldKey.currentState?.openDrawer();
  }

  void selectItem(index){
    currentIndex.value=index;
  }


  final screens = [
     HomeScreen(),
     AllProductsScreen(),
     SearchScreen(),
     FavoritesScreen(),

  ].obs;

  List<BottomNavigationBarItem> bottomNavItem=[
    const BottomNavigationBarItem(icon: Icon(IconBroken.Home),label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(IconBroken.Category),label: 'Categories'),
    const BottomNavigationBarItem(icon: Icon(IconBroken.Heart),label: 'Favorites'),
    const BottomNavigationBarItem(icon: Icon(IconBroken.Profile),label: 'Profile'),
  ].obs;

  List<Widget>pages=[
    const Text('Home',style: textStyle,),
    const Text('Categories',style: textStyle,),
    const Text('Favorites',style: textStyle,),
    const Text('Profile',style: textStyle,),
  ].obs;


}
