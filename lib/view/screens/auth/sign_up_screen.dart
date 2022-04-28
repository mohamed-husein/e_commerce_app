import 'package:e_commerce_app/logic/controller/auth_controller.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/view/widgets/text_form_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../routes/routes.dart';
import '../../widgets/button_utils.dart';
import '../../widgets/sign_up_with_button.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
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
                    'Create new account',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold,color: mainColor),
                  ),
                ),
                Text(
                  'please fill in the form to continue',
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
                  controller: nameController,
                  validator: (value) {
                    if (!RegExp(validationName).hasMatch(value)) {
                      return 'Enter valid name';
                    }
                    return null;
                  },
                  hintText: 'Full Name',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset('assets/icons/User.svg',color: mainColor),
                  ),
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
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset('assets/icons/envelope.svg',color: mainColor),
                  ),
                ),
                TextFormFieldUtils(
                  obscureText: false,
                  controller: phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your phone';
                    }
                    return null;
                  },
                  hintText: 'Phone',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset('assets/icons/phone-call.svg',color: mainColor),
                  ),
                ),
                GetBuilder<AuthController>(builder: (context) {
                  return TextFormFieldUtils(
                    obscureText: !controller.isVisibility,
                    controller: passController,
                    validator: (value) {
                      if (value.toString().length < 6) {
                        return 'Password must be at least 6 number';
                      }
                      return null;
                    },
                    hintText: 'Password',
                    isSuffix: true,
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.changeVisibility();
                      },
                      icon: controller.isVisibility
                          ? Icon(
                              Icons.visibility_off_outlined,
                              color: mainColor,
                            )
                          : Icon(
                              Icons.visibility_outlined,
                              color: mainColor,
                            ),
                    ),
                    prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset('assets/icons/lock.svg',color: mainColor),
                  ),
                  );
                }),
                const SizedBox(
                  height: 25,
                ),
                GetBuilder<AuthController>(
                  builder: (context) => ButtonUtils(
                    text: 'Sign Up',
                    onPressed: () {
                      controller.signUpWithFireBase(
                          email: emailController.text.trim(),
                          pass: passController.text,
                          phone: phoneController.text.trim(),
                          name: nameController.text.trim());
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Or sign up with',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

              SignUpWithButton(
                          onPressed: () {

                          },
                          imageName: 'assets/images/google.png',
                          text: 'Google',
                        ),

                      SignUpWithButton(
                        onPressed: () {},
                        imageName: 'assets/images/facebook.png',
                        text: 'Facebook',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       const Text('Have an account?',style:  TextStyle(color: Colors.black),),
                      const SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.loginScreen);
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
