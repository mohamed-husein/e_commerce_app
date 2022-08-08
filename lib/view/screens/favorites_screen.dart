import 'package:e_commerce_app/logic/controller/products_controller.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  final controller = Get.put(ProductsController());

  FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if(controller.favoriteList.isEmpty){
            return Column(

              children: [
                const SizedBox(height: 150,),
                Center(child: SvgPicture.asset('assets/images/empty_favorite_light_screen.svg',width: MediaQuery.of(context).size.width-100,)),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                      'Please, Add your favorite products to see here',
                      textAlign: TextAlign.center,
                      style:Theme.of(context).textTheme.headline6!.copyWith(color: Colors.grey,fontSize: 18)
                  ),
                )
              ],
            );
          }
          else {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Container(
                  height: 10,
                  color: Colors.grey.shade50,
                );
              },
              itemCount: controller.favoriteList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return buildFavoritesItems(
                  context,
                  image: controller.favoriteList[index].image,
                  price: controller.favoriteList[index].price,
                  title: controller.favoriteList[index].title,
                  productId: controller.favoriteList[index].id,
                );
              });
          }
        },
      ),
    );
  }

  Widget buildFavoritesItems(context,
      {required String image,
      required double price,
      required String title,
      required int productId}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10,right: 16,left: 16),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  height: 120,width: 100,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    price.toString() + ' \$',
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
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      controller.manageFavorite(productId);
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/heart-solid.svg',
                      color: controller.isFavorite(productId)
                          ? Colors.red
                          : Colors.black,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/shopping-cart.svg',
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
