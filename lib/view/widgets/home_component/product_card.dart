import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/content.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
    required this.bgColor,
  }) : super(key: key);
  final String image, title;
  final VoidCallback press;
  final int price;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: 160,
            padding: const EdgeInsets.all(defaultPadding / 2),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: const BorderRadius.all(
                        Radius.circular(defaultBorderRadius)),
                  ),
                  child: Image.asset(
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
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: defaultPadding / 4),
                    Text(
                      "\$" + price.toString(),
                      style: Theme.of(context).textTheme.subtitle2,
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
          ),
        ],
      ),
    );
  }
}
