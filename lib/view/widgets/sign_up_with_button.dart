import 'package:flutter/material.dart';


class SignUpWithButton extends StatelessWidget {
  final String text;
  final String imageName;
  final VoidCallback onPressed;



  const SignUpWithButton({Key? key, required this.text, required this.onPressed, required this.imageName,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: MaterialButton(

          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 15,backgroundColor: Colors.white,
                  child: Image.asset(imageName)),
              const SizedBox(width: 5,),
              Text(
                text,
                style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
              ),
            ],
          ),
          color:  Colors.white,
          height: 60,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minWidth: MediaQuery.of(context).size.width/2-50,
        ),
      ),
    );
  }
}
