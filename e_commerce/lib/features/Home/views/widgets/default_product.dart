import 'package:e_commerce/core/app_assets/app_colors.dart';
import 'package:e_commerce/core/app_assets/app_icons.dart';
import 'package:e_commerce/core/app_assets/app_styles.dart';
import 'package:e_commerce/features/Home/views/widgets/add_item_counter.dart';
import 'package:e_commerce/features/Home/views/widgets/rate_container.dart';
import 'package:e_commerce/features/cart/manager/cart_cubit.dart';
import 'package:e_commerce/features/cart/manager/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultProduct extends StatelessWidget {
  final String itemLabel;
  final double rate;
  final double price;
  final String description;
  final String image;
  const DefaultProduct(
      {super.key,
      required this.itemLabel,
      required this.rate,
      required this.price,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CartCubit()..addItem(label: 'itemLabel', image: 'image', price: 15.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(itemLabel, style: AppStyles.itemPageLabel),
            SizedBox(width: 10),
            RateContainer(rate: rate, color: AppColors.orange)
          ]),
          Container(
            height: 224,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
            ),
            child: Image.network(image),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                  child: Text('\$${price.toString()}0',
                      style: AppStyles.itemPriceStyle)),
              AddItemCounter()
            ],
          ),
          Text(description, style: AppStyles.itemDescription),
          SizedBox(height: 20),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(180, 33),
                    shadowColor: Colors.transparent,
                    backgroundColor: AppColors.orange,
                    side: BorderSide(color: Colors.transparent),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(44)),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.cart2),
                      SizedBox(width: 10),
                      Text('Add to cart',
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontFamily: 'LeagueSpartan',
                              fontWeight: FontWeight.w500)),
                    ],
                  ));
            },
          )
        ],
      ),
    );
  }
}
