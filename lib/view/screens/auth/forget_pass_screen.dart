import 'package:e_commerce_app/logic/controller/auth_controller.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/view/widgets/button_utils.dart';

import 'package:e_commerce_app/view/widgets/text_form_utils.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/icon_broken.dart';
import '../../../utils/my_string.dart';

class ForgetPassScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  ForgetPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    IconBroken.Bag,
                    size: 100,
                    color: mainColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Forgot',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      'Password?',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          height: .8),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Don\'t worry! it happens. please enter the address associated with your account',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
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
              const SizedBox(
                height: 25,
              ),
              GetBuilder<AuthController>(
                builder: (context) => ButtonUtils(
                  text: 'Submit',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      controller.resetPassword(emailController.text.trim());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
