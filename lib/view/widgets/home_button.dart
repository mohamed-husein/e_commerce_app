import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class HomeButton extends StatelessWidget {
  final String text;
  const HomeButton({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 48,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: mainColor,
              shape: const StadiumBorder()),
          child:  Text(text),
        ),
      ),
    );
  }
}
