import 'package:e_commerce_app/utils/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ),
        centerTitle: true,
        title: Text(
          "Favorites",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/shopping-cart.svg"),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: List.generate(5, (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Image.asset(
                        'assets/images/product_0.png',
                        height: 130,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                        Text(
                          'Long Sleeve Shirt',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 16,color: Colors.grey),
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          '50\$',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Expanded(child: IconButton(onPressed: (){}, icon: const Icon(IconBroken.Heart))),
                      Expanded(child: IconButton(onPressed: (){}, icon: const Icon(IconBroken.Bag_2)))
                    ],
                  )
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
