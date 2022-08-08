import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
   SectionTitle({
    Key? key,
    required this.title,
     this.pressSeeAll,required this.text,
  }) : super(key: key);
  final String title;
  final String text;
   VoidCallback? pressSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
        ),
        TextButton(
          onPressed: pressSeeAll,
          child:  Text(
            text,
            style: const TextStyle(color: Colors.black54),
          ),
        )
      ],
    );
  }
}
