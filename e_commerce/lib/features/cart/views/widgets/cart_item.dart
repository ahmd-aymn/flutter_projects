import 'package:e_commerce/core/app_assets/app_styles.dart';
import 'package:e_commerce/features/Home/views/widgets/add_item_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/app_assets/app_icons.dart';

class CartItem extends StatelessWidget {
  final String label;
  final String image;
  final double price;
  const CartItem(
      {super.key,
      required this.label,
      required this.image,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 81,
      child: Row(
        children: [
          Container(
            width: 100,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(image),
          ),
          SizedBox(width: 10),
          Column(
            children: [
              Text(label, style: AppStyles.itemPageLabel),
              Text('\$${price}0', style: AppStyles.nameHintStyle)
            ],
          ),
          Expanded(child: SizedBox()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(AppIcons.recycle),
              SizedBox(height: 47),
              AddItemCounter()
            ],
          )
        ],
      ),
    );
  }
}

/*
class CartItemInfo
{
  String label;
  double price;
  String image;

  CartItemInfo(this.image, this.price, this.label);

  List<CartItem> addItem(Cart)
}
*/
