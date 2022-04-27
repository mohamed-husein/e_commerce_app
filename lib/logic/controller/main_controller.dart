import 'package:e_commerce_app/utils/icon_broken.dart';
import 'package:e_commerce_app/view/screens/category_screen.dart';
import 'package:e_commerce_app/view/screens/favorites_screen.dart';
import 'package:e_commerce_app/view/screens/home_screen.dart';
import 'package:e_commerce_app/view/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../view/screens/main_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen()
  ].obs;

  List<BottomNavigationBarItem> bottomNavItem=[
    BottomNavigationBarItem(icon: Icon(IconBroken.Home),label: 'Home'),
    BottomNavigationBarItem(icon: Icon(IconBroken.Category),label: 'Categories'),
    BottomNavigationBarItem(icon: Icon(IconBroken.Heart),label: 'Favorites'),
    BottomNavigationBarItem(icon: Icon(IconBroken.Profile),label: 'Profile'),
  ].obs;

  List<Widget>pages=[
    const Text('Home',style: textStyle,),
    const Text('Categories',style: textStyle,),
    const Text('Favorites',style: textStyle,),
    const Text('Profile',style: textStyle,),
  ].obs;



}
