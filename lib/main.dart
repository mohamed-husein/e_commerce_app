import 'package:e_commerce_app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GetStorage().read('getStart');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E_Commerce',
      themeMode: Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontFamily: 'Gordita'),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        fontFamily: 'Gordita',
      ),
      initialRoute:FirebaseAuth.instance.currentUser != null ||
          GetStorage().read<bool>('isLogin') == true
          ? AppRoutes.main
          : AppRoutes.welcome,
      getPages: AppRoutes.route,
    );
  }
}
