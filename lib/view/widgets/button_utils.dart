import 'package:e_commerce_app/utils/colors.dart';
import 'package:flutter/material.dart';


class ButtonUtils extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;



  const ButtonUtils({Key? key, required this.text, required this.onPressed,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
          ),
          color: mainColor,
          height: 60,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minWidth: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
