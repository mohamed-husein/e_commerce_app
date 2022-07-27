import 'package:e_commerce_app/logic/controller/cart_controller.dart';
import 'package:e_commerce_app/logic/controller/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';
import '../../utils/colors.dart';
import '../../utils/contant.dart';
import '../widgets/home_component/categories.dart';
import '../widgets/home_component/new_arrival_products.dart';
import '../widgets/home_component/search_form.dart';
import '../widgets/home_component/section_title.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(ProductsController());
  final cartController = Get.lazyPut(() => CartController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
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
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 16),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset("assets/icons/Notification.svg"),
              onPressed: () {
                Get.toNamed(Routes.allProductScreen);
              },
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
                              vertical: defaultPadding),
                          child: SectionTitle(
                            text: 'See All',
                            title: "Product",
                            pressSeeAll: () {
                              Get.toNamed(Routes.allProductScreen);
                            },
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
                                                  controller.productsList[index]
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
                                                      .productsList[index].id);
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
                                              CartController().addProductToCart(controller.productsList[index]);
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
