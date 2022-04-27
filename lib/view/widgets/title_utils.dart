import 'package:e_commerce_app/utils/colors.dart';
import 'package:flutter/material.dart';

class TitleUtils extends StatelessWidget {
  final String text;
  const TitleUtils({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style:Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w600,color: mainColor),
    );
  }
}
