import 'package:e_commerce_app/logic/controller/cart_controller.dart';
import 'package:e_commerce_app/logic/controller/products_controller.dart';
import 'package:e_commerce_app/model/products_model.dart';
import 'package:e_commerce_app/view/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/content.dart';

class AllProductsScreen extends StatelessWidget {
  final controller = Get.find<ProductsController>();
  final cartController = Get.find<CartController>();

  AllProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Scaffold(
           body: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Explore",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.w500, color: mainColor),
                    ),
                    const Text(
                      "best Outfits and Products for you",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: controller.productsList.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 9.0,
                    crossAxisSpacing: 6.0,
                    maxCrossAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) {
                    return buildProductsItem(context,
                        image: controller.productsList[index].image,
                        title: controller.productsList[index].title,
                        price: controller.productsList[index].price,
                        productId: controller.productsList[index].id,
                      productsModel: controller.productsList[index],
                      index: index,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  Widget buildProductsItem(context,
      {required String image, required String title, required double price,required int productId,required ProductModels productsModel,required int index}) {
    return InkWell(
      onTap: (){
        Get.to(()=>ProductDetailsScreen(product: productsModel,));
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
            child: Obx((){return Row(
              children: [
                IconButton(
                  onPressed: () {
                    controller.manageFavorite(productId);
                  },
                  icon: CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child:controller.isFavorite(productId)? SvgPicture.asset(
                      "assets/icons/heart-solid.svg",color: Colors.red,
                      height: 20,
                    ): SvgPicture.asset('assets/icons/unselected_heart.svg',color: Colors.white,),
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
            );}),
          )
        ],
      ),
    );
  }
}
