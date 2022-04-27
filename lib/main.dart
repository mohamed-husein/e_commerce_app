import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      themeMode:Get.isDarkMode? ThemeMode.light:ThemeMode.dark,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme:  const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        fontFamily: 'JannaFont',
      ),
      initialRoute: AppRoutes.welcome,
      getPages:AppRoutes.route,
    );
  }
}
