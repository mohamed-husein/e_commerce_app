import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/view/widgets/description_utils.dart';
import 'package:e_commerce_app/view/widgets/title_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets/button_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, bottom: 70),
            child: Center(
              child: Image.asset(
                'assets/images/hero.jpg',
                width: 250,
                height: 250,
              ),
            ),
          ),
          const TitleUtils(text:'Welcome'),
          const SizedBox(
            height: 15,
          ),
          const DescriptionUtils(text: 'Ready to start shopping Sign up'),
          const Expanded(
            child: DescriptionUtils(text: 'to get start'),
          ),
          ButtonUtils(
            text: 'Sign Up',
            onPressed: () {
              Get.offNamed(Routes.signUpScreen);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have a account?'),
                const SizedBox(
                  width: 4,
                ),
                InkWell(
                  onTap: () {
                    Get.offNamed(Routes.loginScreen);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: HexColor('4c4df8'),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
