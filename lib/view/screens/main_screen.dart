import 'package:e_commerce_app/logic/controller/auth_controller.dart';
import 'package:e_commerce_app/logic/controller/main_controller.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/content.dart';
import 'package:e_commerce_app/view/widgets/draw_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomNavItem {
  final String icon;

  BottomNavItem({
    required this.icon,
  });
}

const TextStyle textStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);

class MainScreen extends StatelessWidget {
  final List<BottomNavItem> selectedItems = [
    BottomNavItem(
      icon: 'assets/icons/home-solid.svg',
    ),
    BottomNavItem(
      icon: 'assets/icons/shopping-bag -solid.svg',
    ),
    BottomNavItem(
      icon: 'assets/icons/search-solid.svg',
    ),
    BottomNavItem(
      icon: 'assets/icons/heart-solid.svg',
    ),
  ];
  final List<BottomNavItem> unselectedItems = [
    BottomNavItem(
      icon: 'assets/icons/unselected_home.svg',
    ),
    BottomNavItem(
      icon: 'assets/icons/shopping-bag.svg',
    ),
    BottomNavItem(
      icon: 'assets/icons/Search Icon.svg',
    ),
    BottomNavItem(
      icon: 'assets/icons/unselected_heart.svg',
    ),
  ];
  final controller = Get.find<MainController>();
  final authController = Get.find<AuthController>();

  MainScreen({Key? key}) : super(key: key);

  List<String> titles = [
    '15/2 New Texas',
    'All Products',
    'Search',
    'Favorites'
  ];

  void _launchURL(String url) async {
    await canLaunchUrl(Uri.parse(url))
        ? await launchUrl(Uri.parse(url))
        : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();

              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: SvgPicture.asset("assets/icons/menu.svg"),
            );
          }),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.currentIndex.value == 0
                  ? SvgPicture.asset("assets/icons/Location.svg")
                  : const Text(
                      '',
                      style: TextStyle(fontSize: 0),
                    ),
              const SizedBox(width: defaultPadding / 2),
              Text(
                titles[controller.currentIndex.value],
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
              },
            ),
          ],
        ),
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: IndexedStack(
          children: controller.screens,
          index: controller.currentIndex.value,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20, right: 16, left: 16),
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Get.isDarkMode ? Colors.black26 : Colors.grey.shade200,
            ),
            child: Center(
              child: Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: List.generate(selectedItems.length, (index) {
                  return InkWell(
                    onTap: () {
                      controller.selectItem(index);
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                      height: 22,
                      child: SvgPicture.asset(
                        controller.currentIndex.value == index
                            ? selectedItems[index].icon
                            : unselectedItems[index].icon,
                        height: 20,
                        width: 20,
                        color: controller.currentIndex.value == index
                            ? mainColor
                            : Colors.black,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage:
                        NetworkImage('https://pbs.twimg.com/profile_images/1550835130708680706/Ym2_JYlq_400x400.jpg'),
                      ),
                       SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Mohamed Hussein',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                       SizedBox(
                        height: 2,
                      ),
                      Text(
                        'mhamedhussein529@outlook.com',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                DrawItem(
                    text: 'Profile',
                    onPressed: () {},
                    icon: 'assets/icons/user-drawer.svg'),
                DrawItem(
                    text: 'Your Cart',
                    onPressed: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                    icon: 'assets/icons/shopping-cart-drawer.svg'),

                DrawItem(
                    text: 'Facebook',
                    onPressed: () {
                      _launchURL(
                          'https://www.facebook.com/profile.php?id=100004579516331');
                    },
                    icon: 'assets/icons/facebook.svg'),
                DrawItem(
                    text: 'LinkedIn',
                    onPressed: () {
                      _launchURL(
                          'https://www.linkedin.com/in/mohamed-hussein-aab3561b1/');
                    },
                    icon: 'assets/icons/linkedin.svg'),
                DrawItem(
                    text: 'Add Friends',
                    onPressed: () {},
                    icon: 'assets/icons/user-add-drawer.svg'),
                DrawItem(
                    text: 'Sign Out',
                    onPressed: () {
                      AuthController().signOut();
                    },
                    icon: 'assets/icons/sign-out-alt-drawer.svg'),
              ],
            ),
          ),
        ),
      );
    });
  }
}

//
