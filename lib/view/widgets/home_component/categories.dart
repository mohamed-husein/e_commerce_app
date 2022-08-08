import 'package:e_commerce_app/logic/controller/category_controller.dart';
import 'package:e_commerce_app/view/screens/category_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/Category.dart';
import '../../../utils/content.dart';

class Categories extends StatelessWidget {
  Categories({
    Key? key,
  }) : super(key: key);
  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categoryNameList.length,
        itemBuilder: (context, index) => CategoryCard(
          icon: demo_categories[index].icon,
          title: controller.categoryNameList[index],
          press: () {
            controller.getCategoryIndex(index);
            Get.to(() => CategoriesItems(title: controller.categoryNameList[index]));
          },
        ),
        separatorBuilder: (context, index) =>
            const SizedBox(width: defaultPadding),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  CategoryCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String icon, title;
  final VoidCallback press;
  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => OutlinedButton(
          onPressed: press,
          style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(defaultBorderRadius)),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: defaultPadding / 2, horizontal: defaultPadding / 4),
            child: controller.isCategoryLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Image.asset(
                        icon,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(height: defaultPadding / 2),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.subtitle2,
                      )
                    ],
                  ),
          ),
        ));
  }
}
