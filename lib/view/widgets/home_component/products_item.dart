import 'package:e_commerce_app/view/widgets/home_component/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/colors.dart';
import '../../../utils/contant.dart';
class BuildProductsItem extends StatelessWidget {
  const BuildProductsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
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
                padding: const EdgeInsets.only(right: defaultPadding),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: 160,
                      padding: const EdgeInsets.all(defaultPadding / 2),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(defaultBorderRadius)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(defaultBorderRadius)),
                            ),
                            child: Image.asset(
                              'assets/images/product_0.png',
                              height: 132,
                            ),
                          ),
                          const SizedBox(height: defaultPadding / 2),
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  'product1',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              const SizedBox(width: defaultPadding / 4),
                              Text(
                                "300",
                                style:
                                Theme.of(context).textTheme.subtitle2,
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
                            onPressed: () {},
                            icon: CircleAvatar(
                              backgroundColor: Colors.grey.shade300,
                              child: SvgPicture.asset(
                                "assets/icons/Heart.svg",
                                height: 20,
                              ),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: CircleAvatar(
                              backgroundColor: Colors.grey.shade300,
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
    );
  }
}
