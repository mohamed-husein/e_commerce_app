import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/view/widgets/description_utils.dart';
import 'package:e_commerce_app/view/widgets/title_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnBoard {
  final String image, title, description;

  OnBoard(
      {required this.image, required this.title, required this.description});
}

final List<OnBoard> demoData = [
  OnBoard(
      title: 'Find the item you have been looking for',
      description:
          'Here you\'will see rich varieties of goods, carefully classified for seamless browsing experience',
      image: 'assets/images/undraw_shopping_app_flsj.svg'),
  OnBoard(
      title: 'Pick up the favorite things',
      description: 'Find your favorite products that you need to buy daily',
      image: 'assets/images/undraw_empty_cart_co35.svg'),
  OnBoard(
      title: 'Easy and safe payment',
      description: 'Pay for the products you buy easily and safety',
      image: 'assets/images/undraw_online_payments_re_y8f2.svg'),
];

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  PageController pageController=PageController();
  int pageIndex=0;
  bool isLast=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          children: [
            Expanded(
              child: PageView.builder(
                physics:const BouncingScrollPhysics() ,
                controller:pageController ,
                onPageChanged:(index){
                  setState(() {
                    pageIndex=index;
                  });
                  if(index == demoData.length-1)
                  {
                    setState(() {
                      isLast=true;
                    });
                  }
                  else
                  {
                    setState(() {
                      isLast=false;
                    });
                  }
                } ,
                itemBuilder: (context, index) {
                  return buildOnBoardItems(demoData[index]);
                },
                itemCount: demoData.length,
              ),
            ),
            Row(
              children: [
                ...List.generate(demoData.length ,(index) =>dotIndicator(isActive: index == pageIndex)),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: FloatingActionButton(
                    backgroundColor: mainColor,
                      child: SvgPicture.asset('assets/icons/arrow.svg',color: Colors.white,),
                      onPressed: (){
                        if(isLast==true)
                        {
                          Get.offNamed(Routes.welcomeScreen);
                        }
                        else
                        {
                          pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                        }
                      },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildOnBoardItems(OnBoard onBoard) {
    return Column(
      children: [
        const Spacer(),
        SvgPicture.asset(
          onBoard.image,
          height: 180,
          width: MediaQuery.of(context).size.width / 1.3,
        ),
        const Spacer(),
        TitleUtils(text: onBoard.title),
        const SizedBox(
          height: 16,
        ),
        DescriptionUtils(text: onBoard.description),
        const Spacer()
      ],
    );
  }
  Widget dotIndicator({bool isActive =false})
  {
    return Padding(
      padding: const EdgeInsets.only(right: 4,top: 5),
      child: Container(
        margin: const EdgeInsets.only(bottom: 2),
        width: 8,
        height:isActive? 25:8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:isActive? mainColor:mainColor.withOpacity(.3)
        ),
      ),
    );
  }
}
