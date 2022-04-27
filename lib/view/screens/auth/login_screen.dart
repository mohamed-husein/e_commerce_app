import 'package:e_commerce_app/logic/controller/auth_controller.dart';
import 'package:e_commerce_app/utils/icon_broken.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/text_form_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../widgets/button_utils.dart';
import '../../widgets/sign_up_with_button.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final controller = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    'Welcome Back!',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'please login to your account',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormFieldUtils(
                  obscureText: false,
                  controller: emailController,
                  validator: (value) {
                    if (value.toString().length <= 2 ||
                        !RegExp(validationEmail).hasMatch(value)) {
                      return 'Enter valid email';
                    }
                    return null;
                  },
                  hintText: 'Email',
                  prefixIcon: Icon(IconBroken.Message, color: mainColor),
                ),
                GetBuilder<AuthController>(builder: (context) {
                  return TextFormFieldUtils(
                    obscureText: !controller.isVisibility,
                    validator: (value) {
                      if (value.toString().length < 6) {
                        return 'Enter valid password';
                      }
                      return null;
                    },
                    controller: passController,
                    hintText: 'Password',
                    isSuffix: true,
                    suffixIcon: IconButton(
                      onPressed: (){
                        controller.changeVisibility();
                      },
                      icon:controller.isVisibility? Icon(
                        Icons.visibility_off,
                        color: mainColor,
                      ):Icon(
                        Icons.visibility,
                        color: mainColor,
                      ),
                    ),
                    prefixIcon: Icon(IconBroken.Lock, color: mainColor),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.forgetPassScreen);
                      },
                      child: Text(
                        'Forget password?',
                        style: TextStyle(
                          color: HexColor('4c4df8'),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GetBuilder<AuthController>(
                  builder:(context)=> ButtonUtils(
                    text: 'Login',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        controller.loginWithFireBase(email: emailController.text.trim(), pass: passController.text);
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Or login with',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GetBuilder<AuthController>(
                          builder:(context)=> SignUpWithButton(
                            onPressed: () {
                              controller.googleSignUp();
                            },
                            imageName: 'assets/images/google.png',
                            text: 'Google',
                          ),
                        ),
                        SignUpWithButton(
                          onPressed: () {},
                          imageName: 'assets/images/facebook.png',
                          text: 'Facebook',
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      const SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.signUpScreen);
                        },
                        child: Text(
                          'Sign Up',
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
          ),
        ),
      ),
    );
  }
}
