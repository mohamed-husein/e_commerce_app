import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Container(
        height: 1,
        color: Colors.grey.shade200,
      ),
    );
  }
}
