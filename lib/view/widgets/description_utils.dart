import 'package:flutter/material.dart';

class DescriptionUtils extends StatelessWidget {
  final String text;
  const DescriptionUtils({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style:Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.black,)
    );
  }
}
