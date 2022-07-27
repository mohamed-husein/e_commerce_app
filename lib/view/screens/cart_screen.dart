import 'package:e_commerce_app/view/cart_items.dart';
import 'package:e_commerce_app/view/widgets/empty_cart.dart';
import 'package:e_commerce_app/view/widgets/home_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../logic/controller/cart_controller.dart';
import '../widgets/divider.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cart Items",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
        actions: [
          MaterialButton(
            onPressed: () {},
            child: SvgPicture.asset('assets/icons/trash.svg'),
            minWidth: 30,
          )
        ],
      ),
      bottomNavigationBar: controller.productsMap.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                color: Colors.white,
                height: 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Sub Total",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        const Spacer(),
                        Text(
                          '${controller.total.toStringAsFixed(2)} \$',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                    const MyDivider(),
                    Row(
                      children: [
                        const Text(
                          "Delivery",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        const Spacer(),
                        Text(
                          '10 \$',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        SizedBox(
                          width: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Total",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              Text(
                                "${controller.total.toStringAsFixed(2) + 10}  \$",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: HomeButton(
                            text: 'Checkout',
                            onPressed: () {},
                            width: MediaQuery.of(context).size.width - 80,
                            border: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
      body: Obx(
        () {
          if (controller.productsMap.isEmpty) {
            return const EmptyCart();
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CartItems(
                            productsModel:
                                controller.productsMap.keys.toList()[index],
                            quantity:
                                controller.productsMap.values.toList()[index],
                            index: index);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: controller.productsMap.length,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

/*
Container(
                  color: Colors.white,
                  height: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(height: 20,),
                      Row(
                        children:  [
                          const Text(
                            "Sub Total",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          const Spacer(),
                          Text(
                            '20 \$',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12,color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                      const MyDivider(),
                      Row(
                        children:  [
                          const Text(
                            "Delivery",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          const Spacer(),
                          Text(
                            '10 \$',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12,color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children:  [
                          SizedBox(
                            width: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                const Text(
                                  "Total",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                Text(
                                  "30 \$",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 11,color: Colors.grey.shade500),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: HomeButton(text: 'Checkout', onPressed: (){},width: MediaQuery.of(context).size.width-80,border: 10,),
                          ),
                          const SizedBox(height: 10,),
                        ],
                      ),

                    ],
                  ),
                )
*/

/*
Container(
      height: 130,
      decoration: BoxDecoration(
          color: const Color(0xFFFEFBF9),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image:  DecorationImage(
                      image: AssetImage(
                          productsModel.image),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: SizedBox(
                height: 125,
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      productsModel.title,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      productsModel.category.toString(),
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black26,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${productsModel.price} \$',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3.50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    cartController.productSubTotal,
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '',
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap:(){
                          cartController.removeProductsFarmCart(productsModel);
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius:
                              BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: SvgPicture.asset(
                              'assets/icons/minus-small.svg',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        '1',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      InkWell(
                        onTap:(){
                          cartController.addProductToCart(productsModel: productsModel);
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius:
                              BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: SvgPicture.asset(
                              'assets/icons/plus-small.svg',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
 */
