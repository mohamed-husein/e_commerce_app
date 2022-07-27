import 'dart:async';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/view/widgets/description_utils.dart';
import 'package:e_commerce_app/view/widgets/title_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      Get.toNamed(AppRoutes.welcome);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Get.isDarkMode ? 'assets/images/dark-background.jpg':
            'assets/images/background-white.jpg',
            width: double.infinity,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 50,
                ),
                Spacer(),
                TitleUtils(
                  text: 'Online Shopping',
                ),
                SizedBox(
                  height: 15,
                ),
                DescriptionUtils(
                  text:
                      'Find your favorite products that you need to buy daily',
                ),
                Spacer(),
                SizedBox(height: 60,)
              ],
            ),
          ),
        ],
      ),
    );
  }
// Widget screenContent() {
//   return Column(
//     children: [
//       const TitleUtils(text: 'Welcome'),
//       const SizedBox(
//         height: 15,
//       ),
//       const DescriptionUtils(text: 'Ready to start shopping Sign up'),
//       const Expanded(
//         child: DescriptionUtils(text: 'to get start'),
//       ),
//       ButtonUtils(
//         text: 'Sign Up',
//         onPressed: () {
//           Get.offNamed(Routes.signUpScreen);
//         },
//       ),
//       Padding(
//         padding: const EdgeInsets.only(top: 8, bottom: 30),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Already have a account?'),
//             const SizedBox(
//               width: 4,
//             ),
//             InkWell(
//               onTap: () {
//                 Get.offNamed(Routes.loginScreen);
//               },
//               child: Text(
//                 'Login',
//                 style: TextStyle(
//                   color: HexColor('4c4df8'),
//                 ),
//               ),
//               borderRadius: BorderRadius.circular(5),
//             ),
//           ],
//         ),
//       )
//     ],
//   );
// }
}
