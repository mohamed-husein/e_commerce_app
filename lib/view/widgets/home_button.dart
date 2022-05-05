import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const HomeButton({Key? key,required this.text,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 48,
        child: ElevatedButton(
          onPressed:onPressed,
          style: ElevatedButton.styleFrom(
              primary: mainColor,
              shape: const StadiumBorder()),
          child:  Text(text),
        ),
      ),
    );
  }
}
