import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  GetStorage getStorage = GetStorage();

  setThemeMode(bool isDarkKey) {
    String isDarkValue = 'isDark';
    getStorage.write(isDarkValue, isDarkKey);
  }

  bool getThemeMode() {
    return getStorage.read<bool>('isDark') ?? false;
  }

  ThemeMode get themeMode => getThemeMode() ? ThemeMode.dark : ThemeMode.light;

  changeMode() {
    Get.changeThemeMode(getThemeMode() ? ThemeMode.light : ThemeMode.dark);
    setThemeMode(!getThemeMode());
  }
}
