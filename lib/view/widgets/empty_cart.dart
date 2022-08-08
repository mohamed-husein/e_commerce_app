import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';
import 'home_button.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 130,
        ),
        Center(
            child: SvgPicture.asset(
          'assets/images/undraw_empty_cart.svg',
          width: MediaQuery.of(context).size.width - 170,
        )),
        const SizedBox(
          height: 50,
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
        const SizedBox(
          height: 5,
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
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: HomeButton(
            text: 'Add Product',
            width: MediaQuery.of(context).size.width,
            border: 15,
            onPressed: () {
              Get.toNamed(Routes.allProductScreen);
            },
          ),
        )
      ],
    );
  }
}
