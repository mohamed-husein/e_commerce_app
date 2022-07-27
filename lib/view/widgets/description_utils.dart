import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionUtils extends StatelessWidget {
  final String text;
  const DescriptionUtils({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style:Theme.of(context).textTheme.headline6!.copyWith(color:Get.isDarkMode?Colors.grey.shade400: Colors.black,fontSize: 18)
      ),
    );
  }
}
