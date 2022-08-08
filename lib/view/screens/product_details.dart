import 'package:e_commerce_app/logic/controller/cart_controller.dart';
import 'package:e_commerce_app/logic/controller/products_controller.dart';
import 'package:e_commerce_app/model/products_model.dart';
import 'package:e_commerce_app/utils/icon_broken.dart';
import 'package:e_commerce_app/view/widgets/description_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import '../../utils/content.dart';
import '../widgets/home_button.dart';
import '../widgets/product_component/color_dot.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key, required this.product,})
      : super(key: key);

  final ProductModels product;

  final controller = Get.put(ProductsController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title:
            const Text('Product Detail', style: TextStyle(color: Colors.black)),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                controller.manageFavorite(product.id);
              },
              icon: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: controller.isFavorite(product.id)
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/icons/heart-solid.svg",
                          color: Colors.red,
                          height: 20,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icons/unselected_heart.svg',
                          color: Colors.black,
                        ),
                      ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Image.network(
            product.image,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: defaultPadding * 1.5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: const EdgeInsets.fromLTRB(defaultPadding,
                    defaultPadding * 2, defaultPadding, defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(defaultBorderRadius * 3),
                    topRight: Radius.circular(defaultBorderRadius * 3),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              product.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontSize: 18),
                            ),
                          ),
                          const SizedBox(width: defaultPadding),
                          Text(
                            "\$" + product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: defaultPadding),
                        child: ReadMoreText(

                          product.description,
                          trimLength: 100,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                      Text(
                        "Colors",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      const SizedBox(height: defaultPadding / 2),
                      Row(
                        children: const [
                          ColorDot(
                            color: Color(0xFFBEE8EA),
                            isActive: false,
                          ),
                          ColorDot(
                            color: Color(0xFF141B4A),
                            isActive: true,
                          ),
                          ColorDot(
                            color: Color(0xFFF4E5C3),
                            isActive: false,
                          ),
                        ],
                      ),
                      const SizedBox(height: defaultPadding * 2),
                      HomeButton(
                          text: 'Add to cart',
                          onPressed: () {
                            cartController.addProductToCart(product);
                          },
                          width: MediaQuery.of(context).size.width,
                          border: 15),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
