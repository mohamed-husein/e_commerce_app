import 'package:e_commerce_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthMiddleWare extends GetMiddleware
{
  @override
  RouteSettings? redirect(String? route)
  {
    if( GetStorage().read('isLogin') == true)
    {
      return const RouteSettings(name: AppRoutes.main);
    }
    return null;
  }
}