import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/view/widgets/description_utils.dart';
import 'package:e_commerce_app/view/widgets/title_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets/button_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            'assets/images/background-white.jpg',
            width: double.infinity,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              Spacer(),
              const TitleUtils(text: 'Online Shopping',),
              const SizedBox(
                height: 15,
              ),
              const DescriptionUtils(text: 'Find your favorite products that you need to buy daily'),
             Spacer()
,              ButtonUtils(
                text: 'Get start',
                onPressed: () {
                  GetStorage().write('getStart', true);
                  Get.offNamed(Routes.loginScreen);
                },
              ),
              SizedBox(height: 50,)

            ],
          ),
        ],
      ),
    );
  }

  Widget ScreenContant() {
    return Column(
      children: [
        const TitleUtils(text: 'Welcome'),
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
    );
  }
}
