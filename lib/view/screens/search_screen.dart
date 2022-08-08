import 'package:e_commerce_app/logic/controller/cart_controller.dart';
import 'package:e_commerce_app/logic/controller/products_controller.dart';
import 'package:e_commerce_app/model/Product.dart';
import 'package:e_commerce_app/model/products_model.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/content.dart';
import 'package:e_commerce_app/view/screens/product_details.dart';
import 'package:e_commerce_app/view/screens/product_screen.dart';
import 'package:e_commerce_app/view/widgets/home_component/product_card.dart';
import 'package:e_commerce_app/view/widgets/home_component/search_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../widgets/home_component/section_title.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final controller = Get.find<ProductsController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<ProductsController>(
                          builder: (_) => TextField(
                                controller: controller.controller,
                                onChanged: (searchName) {
                                  controller.addSearchToList(searchName);
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  hintText: "Search items...",
                                  border: outlineInputBorder,
                                  enabledBorder: outlineInputBorder,
                                  focusedBorder: outlineInputBorder,
                                  errorBorder: outlineInputBorder,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(14),
                                    child: SvgPicture.asset(
                                        "assets/icons/Search Icon.svg"),
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: defaultPadding,
                                        vertical: defaultPadding / 2),
                                    child: SizedBox(
                                      width: 48,
                                      height: 48,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: mainColor,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: SvgPicture.asset(
                                            "assets/icons/Filter.svg"),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SectionTitle(
                    text: '',
                    title: "most searched",
                  ),
                ),
                Expanded(
                  child:GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount:controller.searchList.isEmpty && controller.controller.text.isEmpty? 4: controller.searchList.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            childAspectRatio: 0.8,
                            mainAxisSpacing: 9.0,
                            crossAxisSpacing: 6.0,
                            maxCrossAxisExtent: 200,
                          ),
                          itemBuilder: (context, index) {
                            if(controller.searchList.isEmpty  && controller.controller.text.isEmpty)
                            {
                            return ProductCard(
                            title: demo_product[index].title,
                            image: demo_product[index].image,
                            price: demo_product[index].price,
                            bgColor: demo_product[index].bgColor,
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsScreen(product: demo_product[index]),
                                  ));
                            },
                            );
                            }
                            else{
                              return buildProductsItem(context,
                                image: controller.searchList[index].image,
                                title: controller.searchList[index].title,
                                price: controller.searchList[index].price,
                                productId: controller.searchList[index].id,
                                productsModel: controller.searchList[index],
                                index: index,
                              );
                            }

                          },
                        )

                ),
              ],
            ),
          );
        }
      }),
    );
  }

  Widget buildProductsItem(context,
      {required String image,
      required String title,
      required double price,
      required int productId,
      required ProductModels productsModel,
      required int index}) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailsScreen(
              product: productsModel,
            ));
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: 160,
            padding: const EdgeInsets.all(defaultPadding / 2),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.all(Radius.circular(defaultBorderRadius)),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: bgColor,
                    borderRadius:
                        BorderRadius.all(Radius.circular(defaultBorderRadius)),
                  ),
                  child: Image.network(
                    image,
                    height: 132,
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: defaultPadding / 4),
                    Text(
                      "$price",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 154,
            child: Obx(() {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.manageFavorite(productId);
                    },
                    icon: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      child: controller.isFavorite(productId)
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
                      cartController.addProductToCart(productsModel);
                    },
                    icon: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      child: SvgPicture.asset(
                        "assets/icons/shopping-cart.svg",
                        height: 20,
                      ),
                    ),
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}
