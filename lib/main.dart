import 'package:e_commerce_app/logic/controller/theme_controller.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
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
      themeMode: ThemeController().themeMode,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black)),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Gordita'
      ),
      darkTheme: ThemeData(
        fontFamily: 'Gordita',

        scaffoldBackgroundColor: Colors.black26,
      ),
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.route,
    );
  }
}
