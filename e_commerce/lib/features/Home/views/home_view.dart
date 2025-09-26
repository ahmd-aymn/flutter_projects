import 'package:e_commerce/core/app_assets/app_colors.dart';
import 'package:e_commerce/core/app_assets/app_icons.dart';
import 'package:e_commerce/core/app_assets/app_images.dart';
import 'package:e_commerce/core/app_assets/app_styles.dart';
import 'package:e_commerce/core/helper/my_navigator.dart';
import 'package:e_commerce/core/widgets/show_button.dart';
import 'package:e_commerce/features/Home/views/add_item_view.dart';
import 'package:e_commerce/features/Home/views/widgets/bar_container.dart';
import 'package:e_commerce/features/Home/views/widgets/default_bottom_bar.dart';
import 'package:e_commerce/features/Home/views/widgets/default_search_bar.dart';
import 'package:e_commerce/features/Home/views/widgets/discount_banner_container.dart';
import 'package:e_commerce/features/Home/views/widgets/item_image.dart';
import 'package:e_commerce/features/cart/views/cart_view.dart';
import 'package:e_commerce/features/onBoarding/widgets/default_dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/widgets/body_container.dart';

//I'm Ahmed Ayman
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final scrollController = PageController(viewportFraction: 0.8);
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.lightOrange,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20),
                      DefaultSearchBar(),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          myNavigator(context, screen: CartView());
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.white),
                          child: SvgPicture.asset(AppIcons.cart),
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          myNavigator(context, screen: AddItemView());
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.orange),
                          child: SvgPicture.asset(AppIcons.add),
                        ),
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text('Good Morning', style: AppStyles.titleStyle)),
                  Padding(
                      padding: EdgeInsets.only(left: 22),
                      child: Text("Rise and shine! It's breakfast time",
                          style: AppStyles.orangeSignUpRules)),
                  SizedBox(height: 12),
                  BodyContainer(
                    child: Stack(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                  child: Text('Best Seller',
                                      style: AppStyles.labelStyle)),
                              ShowButton(
                                  label: 'View All',
                                  icon: AppIcons.arrowForward),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              BarContainer(image: AppImages.food_bar_1),
                              SizedBox(width: 10),
                              BarContainer(image: AppImages.food_bar_2),
                              SizedBox(width: 10),
                              BarContainer(image: AppImages.food_bar_3),
                              SizedBox(width: 10),
                              BarContainer(image: AppImages.food_bar_4),
                            ],
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 135,
                            child: ListView.separated(
                              controller: scrollController,
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) => SizedBox(
                                width: screenWidth,
                                child: DiscountBannerContainer(),
                              ),
                              separatorBuilder: (context, index) => SizedBox(),
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(
                              child: DefaultDotsIndicator(
                                  pageController: scrollController, length: 5)),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Recommended',
                                style: AppStyles.labelStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ItemImage(image: AppImages.item_1),
                              SizedBox(width: 10),
                              ItemImage(image: AppImages.item_2)
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ItemImage(image: AppImages.item_1),
                              SizedBox(width: 10),
                              ItemImage(image: AppImages.item_2)
                            ],
                          ),
                        ],
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: DefaultBottomBar());
  }
}
