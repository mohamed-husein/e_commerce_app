import 'package:e_commerce_app/logic/controller/cart_controller.dart';
import 'package:e_commerce_app/logic/controller/products_controller.dart';
import 'package:e_commerce_app/view/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/content.dart';
import '../widgets/home_component/categories.dart';
import '../widgets/home_component/new_arrival_products.dart';
import '../widgets/home_component/section_title.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);
  final controller = Get.put(ProductsController());
  final cartController = Get.lazyPut(() => CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
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
                    .copyWith(fontWeight: FontWeight.w500, color: mainColor),
              ),
              const Text(
                "best Outfits for you",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Categories',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
               Categories(),
              const SizedBox(
                height: 10,
              ),
              const NewArrivalProducts(),
              controller.isLoading.value
                  ? Column(
                      children: const [
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0),
                          child: SectionTitle(
                            text: '',
                            title: "Product",
                          ),
                        ),
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              5,
                              (index) => Padding(
                                padding: const EdgeInsets.only(
                                    right: defaultPadding),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => ProductDetailsScreen(
                                          product:
                                              controller.productsList[index],
                                        ));
                                  },
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Container(
                                        width: 160,
                                        padding: const EdgeInsets.all(
                                            defaultPadding / 2),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  defaultBorderRadius)),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(
                                                color: bgColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        defaultBorderRadius)),
                                              ),
                                              child: Image.network(
                                                controller
                                                    .productsList[index].image,
                                                height: 120,
                                              ),
                                            ),
                                            const SizedBox(
                                                height: defaultPadding / 2),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    controller
                                                        .productsList[index]
                                                        .title,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                const SizedBox(
                                                    width: defaultPadding / 4),
                                                Text(
                                                  "300",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 154,
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                controller.manageFavorite(
                                                    controller
                                                        .productsList[index]
                                                        .id);
                                              },
                                              icon: CircleAvatar(
                                                backgroundColor:
                                                    Colors.grey.shade300,
                                                child: controller.isFavorite(
                                                        controller
                                                            .productsList[index]
                                                            .id)
                                                    ? SvgPicture.asset(
                                                        "assets/icons/heart-solid.svg",
                                                        color: Colors.red,
                                                        height: 20,
                                                      )
                                                    : SvgPicture.asset(
                                                        'assets/icons/unselected_heart.svg',
                                                        color: Colors.white,
                                                      ),
                                              ),
                                            ),
                                            const Spacer(),
                                            IconButton(
                                              onPressed: () {
                                                CartController()
                                                    .addProductToCart(controller
                                                        .productsList[index]);
                                              },
                                              icon: CircleAvatar(
                                                backgroundColor:
                                                    Colors.grey.shade300,
                                                child: SvgPicture.asset(
                                                  "assets/icons/shopping-cart.svg",
                                                  height: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
            ],
          ),
        ),
      );
    });
  }
}
