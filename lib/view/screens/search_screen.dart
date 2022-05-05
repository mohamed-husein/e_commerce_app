import 'package:e_commerce_app/logic/controller/auth_controller.dart';
import 'package:e_commerce_app/logic/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text('Search',style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(
            onPressed: () {},

            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                "assets/icons/Heart.svg",
                height: 20,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          InkWell(
            onTap: (){
              ThemeController().changeMode();
            },
            child: const Text('Search Screen'),
          ),
          SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: (){
              AuthController().signOut();
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
