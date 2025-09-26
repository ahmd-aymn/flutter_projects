import 'package:e_commerce/core/app_assets/app_colors.dart';
import 'package:e_commerce/core/app_assets/app_icons.dart';
import 'package:e_commerce/core/app_assets/app_styles.dart';
import 'package:e_commerce/core/helper/my_navigator.dart';
import 'package:e_commerce/features/Home/data/models/get_categories_response_model.dart';
import 'package:e_commerce/features/Home/views/menu_view.dart';
import 'package:e_commerce/features/Home/views/widgets/default_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/widgets/body_container.dart';

class ProductsView extends StatelessWidget {
  final String title;
  final List<Products> products;
  const ProductsView({super.key, required this.products, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightOrange,
      appBar: AppBar(
        backgroundColor: AppColors.lightOrange,
        leading: IconButton(
            onPressed: () {
              myNavigator(context, screen: MenuView());
            },
            icon: SvgPicture.asset(AppIcons.arrowBackward)),
        title: Text(title, style: AppStyles.titleStyle),
        centerTitle: true,
      ),
      body: BodyContainer(
          child: ListView.separated(
              itemBuilder: (context, index) => DefaultProduct(
                  itemLabel: products[index].name!,
                  rate: products[index].rating!,
                  price: products[index].price!,
                  description: products[index].description!,
                  image: products[index].imagePath!),
              separatorBuilder: (context, index) =>
                  Divider(color: AppColors.extraLightOrange, thickness: 1),
              itemCount: products.length)),
    );
  }
}
