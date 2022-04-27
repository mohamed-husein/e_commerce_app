import 'package:e_commerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/my_string.dart';

class TextFormFieldUtils extends StatelessWidget {
  final TextEditingController controller;
  final bool? obscureText ;

  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool? isSuffix;
  final FormFieldValidator validator;
   const TextFormFieldUtils({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
     this.isSuffix,
     this.obscureText, this.suffixIcon, required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,right: 20,left: 20,bottom: 5),
      child: TextFormField(
        style:  TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
        controller: controller,
        obscureText: obscureText!,
        validator: (value) =>
          validator(value)
        ,
        cursorColor: mainColor,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide:BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide:  BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.grey.shade50,
          filled: true,
          hintText: hintText,
          contentPadding:
               const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
          hintStyle:  TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Get.isDarkMode? Colors.white: Colors.grey),
          prefixIcon : prefixIcon ,
          suffixIcon:isSuffix==true? suffixIcon:null,
        ),
      ),
    );
  }
}
