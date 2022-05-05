import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/view/widgets/home_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Center(
              child: Image.asset(
            'assets/images/empty_cart.png',
            width: MediaQuery.of(context).size.width - 100,
          )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Your cart is empty',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.black, fontSize: 24)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Add item to get start',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.grey, fontSize: 16)),
          ),
          const SizedBox(height: 30,),
          HomeButton(text: 'Go to home',onPressed: (){
            Get.toNamed(Routes.mainScreen);
          },)
        ],
      ),
    );
  }
}
