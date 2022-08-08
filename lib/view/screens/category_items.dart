import 'package:e_commerce_app/logic/controller/cart_controller.dart';
import 'package:e_commerce_app/logic/controller/category_controller.dart';
import 'package:e_commerce_app/logic/controller/products_controller.dart';
import 'package:e_commerce_app/model/products_model.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/content.dart';
import 'package:e_commerce_app/view/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoriesItems extends StatelessWidget {
  CategoriesItems({Key? key,required this.title}) : super(key: key);
  final String title;
  final categoriesController = Get.find<CategoryController>();
  final productsController = Get.find<ProductsController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title.toUpperCase(), style: Theme
              .of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 16),),
        ),
        body: Obx(
                () {
                  if(categoriesController.isCategoryLoading.value)
                  {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  else{
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: categoriesController.categoryList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 6.0,
                  maxCrossAxisExtent: 200,
                ),
                itemBuilder: (context, index) {
                  return buildProductsItem(context,
                    image: categoriesController.categoryList[index].image,
                    title:categoriesController.categoryList[index].title,
                    price: categoriesController.categoryList[index].price,
                    productId: categoriesController.categoryList[index].id,
                    productsModel: categoriesController.categoryList[index],
                    index: index,
                  );
                },
              );}

            }
        )
    );
  }

  Widget buildProductsItem(context,
      {required String image, required String title, required double price, required int productId, required ProductModels productsModel, required int index}) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailsScreen(product: productsModel,));
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
                      style: Theme
                          .of(context)
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
            child: Obx(() {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      productsController.manageFavorite(productId);
                    },
                    icon: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      child: productsController.isFavorite(productId)
                          ? SvgPicture.asset(
                        "assets/icons/heart-solid.svg", color: Colors.red,
                        height: 20,
                      )
                          : SvgPicture.asset(
                        'assets/icons/unselected_heart.svg',
                        color: Colors.white,),
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
