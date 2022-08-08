import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawItem extends StatelessWidget {
   const DrawItem(
      {Key? key, required this.text, required this.onPressed,required this.icon, })
      : super(key: key);
 
  final String text;
  final String icon;
  final VoidCallback onPressed;



  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 20,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(text,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                const Spacer(),
                SvgPicture.asset(icon,width: 20),
              ],
            ),
          ),
        ),
      ) ,
    );
  }

}
