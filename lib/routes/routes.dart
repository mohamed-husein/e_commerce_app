import 'package:e_commerce_app/logic/bindings/auth_binding.dart';
import 'package:e_commerce_app/logic/bindings/main_bindings.dart';
import 'package:e_commerce_app/logic/bindings/products_binging.dart';
import 'package:e_commerce_app/services/auth_middle.dart';
import 'package:e_commerce_app/services/welcome_middle.dart';
import 'package:e_commerce_app/view/screens/all_product_screen.dart';
import 'package:e_commerce_app/view/screens/auth/forget_pass_screen.dart';
import 'package:e_commerce_app/view/screens/auth/login_screen.dart';
import 'package:e_commerce_app/view/screens/auth/sign_up_screen.dart';
import 'package:e_commerce_app/view/screens/auth/splash_screen.dart';
import 'package:e_commerce_app/view/screens/cart_screen.dart';
import 'package:e_commerce_app/view/screens/home_screen.dart';
import 'package:e_commerce_app/view/screens/main_screen.dart';
import 'package:e_commerce_app/view/screens/on_board.dart';
import 'package:e_commerce_app/view/screens/welcome_screen.dart';
import 'package:get/get.dart';


class AppRoutes {
  //initialPage
  static const initial = Routes.splashScreen;
  static const welcome = Routes.welcomeScreen;
  static const main = Routes.mainScreen;
  static const login = Routes.loginScreen;

  //pageRoute

  static final route = [
    GetPage(
      name: Routes.onBoardScreen,
      page: () {
        return const OnBoardScreen();
      },
    ),
    GetPage(
      name: Routes.welcomeScreen,
      middlewares: [WelcomeMiddleWare()],
      page: () {
        return const WelcomeScreen();
      },
    ),
    GetPage(
      name: Routes.loginScreen,
      binding: AuthBindings(),
      middlewares: [AuthMiddleWare()],
      page: () {
        return LoginScreen();
      },
    ),
    GetPage(
      name: Routes.signUpScreen,
      middlewares: [AuthMiddleWare()],
      binding: AuthBindings(),
      page: () {
        return SignUpScreen();
      },
    ),
    GetPage(
      name: Routes.cartScreen,
      binding: AuthBindings(),
      page: () {
        return const CartScreen();
      },
    ),
    GetPage(
      name: Routes.allProductScreen,
      bindings: [
        AuthBindings(),
        MainBindings(),
        ProductsBinding(),
      ],
      page: () {
        return AllProductsScreen();
      },
    ),
    GetPage(
      name: Routes.mainScreen,
      bindings: [
        AuthBindings(),
        MainBindings(),
        ProductsBinding(),
      ],
      page: () {
        return MainScreen();
      },
    ),
    GetPage(
      name: Routes.splashScreen,
      page: () {
        return const SplashScreen();
      },
    ),
    GetPage(
      name: Routes.homeScreen,
      binding: ProductsBinding(),
      page: () {
        return HomeScreen();
      },
    ),
    GetPage(
      name: Routes.forgetPassScreen,
      binding: AuthBindings(),
      page: () {
        return ForgetPassScreen();
      },
    ),
  ];
}

class Routes {
  static const splashScreen = '/splashScreen';
  static const onBoardScreen = '/onBoardScreen';
  static const welcomeScreen = '/welcomeScreen';
  static const forgetPassScreen = '/forgetPassScreen';
  static const mainScreen = '/mainScreen';
  static const loginScreen = '/loginScreen';
  static const allProductScreen='/allProductScreen';
  static const signUpScreen = '/signUpScreen';
  static const homeScreen = '/homeScreen';
  static const cartScreen = '/cartScreen';
}
