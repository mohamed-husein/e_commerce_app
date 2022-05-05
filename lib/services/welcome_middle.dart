import 'package:e_commerce_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WelcomeMiddleWare extends GetMiddleware
{
  @override
  RouteSettings? redirect(String? route)
  {
    if( GetStorage().read('getStart') == true)
    {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}