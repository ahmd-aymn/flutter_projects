import 'package:e_commerce/core/app_assets/app_styles.dart';
import 'package:e_commerce/features/Home/manager/get_categories/get_categories_cubit.dart';
import 'package:e_commerce/features/Home/manager/get_categories/get_categories_state.dart';
import 'package:e_commerce/features/Home/views/products_view.dart';
import 'package:e_commerce/features/Home/views/widgets/default_bottom_bar.dart';
import 'package:e_commerce/features/Home/views/widgets/default_search_bar.dart';
import 'package:e_commerce/features/Home/views/widgets/item_icon.dart';
import 'package:e_commerce/features/cart/views/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/app_assets/app_colors.dart';
import '../../../core/app_assets/app_icons.dart';
import '../../../core/helper/my_navigator.dart';
import '../../../core/widgets/body_container.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => GetCategoriesCubit()..getCategories(),
      child: Scaffold(
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
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    BodyContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 8),
                              ItemIcon(icon: AppIcons.snacks, label: 'Snacks'),
                              SizedBox(width: 15),
                              ItemIcon(icon: AppIcons.meals, label: 'Meals'),
                              SizedBox(width: 15),
                              ItemIcon(icon: AppIcons.vegan, label: 'Vegan'),
                              SizedBox(width: 15),
                              ItemIcon(
                                  icon: AppIcons.desserts, label: 'Desserts'),
                              SizedBox(width: 15),
                              ItemIcon(icon: AppIcons.drinks, label: 'Drinks'),
                            ],
                          ),
                          Divider(
                              color: AppColors.extraLightOrange, thickness: 1),
                          BlocConsumer<GetCategoriesCubit, GetCategoriesState>(
                              listener: (context, state) {
                            print(state.toString());
                          }, builder: (context, state) {
                            if (state is GetCategoriesLoadingState) {
                              return Center(
                                  child: CircularProgressIndicator(
                                      color: AppColors.orange));
                            } else {
                              return Column(
                                children: [
                                  state is GetCategoriesSuccessState
                                      ? SizedBox(
                                          height: screenHeight,
                                          child: ListView.separated(
                                              padding: EdgeInsets.all(20),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    myNavigator(context,
                                                        screen: ProductsView(
                                                            products: state
                                                                .categories[
                                                                    index]
                                                                .products!,
                                                            title: state
                                                                .categories[
                                                                    index]
                                                                .title!));
                                                  },
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            state
                                                                .categories[
                                                                    index]
                                                                .title!,
                                                            style: AppStyles
                                                                .labelStyle),
                                                        SizedBox(height: 10),
                                                        Image.network(state
                                                            .categories[index]
                                                            .imagePath!),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) =>
                                                      SizedBox(height: 20),
                                              itemCount:
                                                  state.categories.length),
                                        )
                                      : state is GetCategoriesErrorState
                                          ? Center(
                                              child: SizedBox(
                                                  child: Text(state.error)))
                                          : SizedBox()
                                ],
                              );
                            }
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: DefaultBottomBar()),
    );
  }
}

/*BlocConsumer<GetCategoriesCubit, GetCategoriesState>(listener: (context, state){print(state.toString());},
                              builder: (context, state)
                              {
                                if (state is GetCategoriesLoadingState)
                                  {
                                    return Center(child: CircularProgressIndicator(color: AppColors.orange));
                                  }
                                else
                                {
                                  return Column(
                                    children: [
                                      state is GetCategoriesSuccessState?
                                      SizedBox(height: screenHeight,
                                        child: ListView.separated(padding: EdgeInsets.all(20), itemBuilder: (context, index) => ItemCategory(title: state.categories[index].title, description: state.categories[index].description, imagePath: state.categories[index].imagePath),
                                            separatorBuilder: (context, index) => SizedBox(height: 20),
                                            itemCount: state.categories.length),
                                      ): state is GetCategoriesErrorState?
                                      Center(child: SizedBox(child: Text(state.error))) : SizedBox()
                                    ],
                                  );
                                }
                              })*/

/*ItemCategory(image: AppImages.mexican_apetizer, label: 'Mexican Appetizer', price: '\$15.00', description: 'Tortilla Chips With Toppings'),
                              Divider(color: AppColors.extraLightOrange, thickness: 1),
                              ItemCategory(image: AppImages.pork_skewer, label: 'Pork Skewer', price: '\$12.99', description: 'Marinated in a rich blend of herbs and spices, \nthen grilled to perfection, served with a side of \nzesty dipping sauce.'),*/
