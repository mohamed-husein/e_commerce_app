import 'package:e_commerce_app/logic/controller/auth_controller.dart';
import 'package:e_commerce_app/logic/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/contant.dart';
import '../widgets/home_component/categories.dart';
import '../widgets/home_component/new_arrival_products.dart';
import '../widgets/home_component/popular_products.dart';
import '../widgets/home_component/search_form.dart';

class HomeScreen extends StatelessWidget {


  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
         appBar: AppBar(
           leading: IconButton(
             onPressed: () {},
             icon: SvgPicture.asset("assets/icons/menu.svg"),
           ),
           title: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               SvgPicture.asset("assets/icons/Location.svg"),
               const SizedBox(width: defaultPadding / 2),
               Text(
                 "15/2 New Texas",
                 style: Theme.of(context).textTheme.bodyText1,
               ),
             ],
           ),
           actions: [
             IconButton(
               icon: SvgPicture.asset("assets/icons/Notification.svg"),
               onPressed: () {},
             ),
           ],
         ),
         body: SingleChildScrollView(
           physics: const BouncingScrollPhysics(
               parent: AlwaysScrollableScrollPhysics()),
           padding: const EdgeInsets.all(defaultPadding),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 "Explore",
                 style: Theme.of(context)
                     .textTheme
                     .headline4!
                     .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
               ),
               const Text(
                 "best Outfits for you",
                 style: TextStyle(fontSize: 18),
               ),
               const Padding(
                 padding: EdgeInsets.symmetric(vertical: defaultPadding),
                 child: SearchForm(),
               ),
               const Categories(),
               const NewArrivalProducts(),
               const PopularProducts(),
             ],
           ),
         ),
      );

  }
}
