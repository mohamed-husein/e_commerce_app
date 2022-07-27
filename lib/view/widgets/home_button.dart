import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  double width;
  double border;

   HomeButton({Key? key,required this.text,required this.onPressed,this.width=200,this.border=50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: 48,
        child: ElevatedButton(
          onPressed:onPressed,
          style: ElevatedButton.styleFrom(
              primary: mainColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(border))),
          child:  Text(text),
        ),
      ),
    );
  }
}
