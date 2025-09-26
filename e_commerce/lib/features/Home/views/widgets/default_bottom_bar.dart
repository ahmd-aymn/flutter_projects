import 'package:e_commerce/features/Home/views/menu_view.dart';
import 'package:e_commerce/features/settings/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/app_assets/app_colors.dart';
import '../../../../core/app_assets/app_icons.dart';
import '../../../../core/helper/my_navigator.dart';
import '../home_view.dart';

class DefaultBottomBar extends StatelessWidget {
  const DefaultBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(color: AppColors.white),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: NavigationBar(backgroundColor: AppColors.orange, destinations: [
          IconButton(
              onPressed: () {
                myNavigator(context, screen: HomeView());
              },
              icon: SvgPicture.asset(AppIcons.home)),
          IconButton(
              onPressed: () {
                myNavigator(context, screen: MenuView());
              },
              icon: SvgPicture.asset(AppIcons.menu2)),
          IconButton(
              onPressed: () {
                myNavigator(context, screen: ProfileView());
              },
              icon: SvgPicture.asset(AppIcons.user_icon))
        ]),
      ),
    );
  }
}
