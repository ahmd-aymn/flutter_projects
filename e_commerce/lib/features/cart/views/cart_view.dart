import 'package:e_commerce/core/app_assets/app_colors.dart';
import 'package:e_commerce/core/app_assets/app_icons.dart';
import 'package:e_commerce/core/app_assets/app_styles.dart';
import 'package:e_commerce/core/helper/my_navigator.dart';
import 'package:e_commerce/core/widgets/body_container.dart';
import 'package:e_commerce/features/Home/views/menu_view.dart';
import 'package:e_commerce/features/cart/manager/cart_cubit.dart';
import 'package:e_commerce/features/cart/manager/cart_state.dart';
import 'package:e_commerce/features/cart/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    List<CartItem> items = [];
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => CartCubit()..getItems(),
      child: Scaffold(
        backgroundColor: AppColors.lightOrange,
        appBar: AppBar(
          backgroundColor: AppColors.lightOrange,
          leading: IconButton(
              onPressed: () {
                myNavigator(context, screen: MenuView());
              },
              icon: SvgPicture.asset(AppIcons.arrowBackward)),
          title: Text('Cart', style: AppStyles.titleStyle),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              BlocConsumer<CartCubit, CartState>(
                builder: (context, state) {
                  return BodyContainer(
                      child: Column(
                    children: [
                      Text('You have ${items.length} items in the cart'),
                      SizedBox(height: 10),
                      SizedBox(
                          height: screenHeight,
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                CartItem item = items[index];
                                counter = items.length;
                                return item;
                              },
                              separatorBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Divider(
                                        color: AppColors.extraLightOrange,
                                        thickness: 1),
                                  ),
                              itemCount: items.length)),
                    ],
                  ));
                },
                listener: (context, state) => print(state.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
