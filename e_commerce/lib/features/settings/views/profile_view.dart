import 'package:e_commerce/core/app_assets/app_colors.dart';
import 'package:e_commerce/core/app_assets/app_icons.dart';
import 'package:e_commerce/core/app_assets/app_images.dart';
import 'package:e_commerce/core/app_assets/app_styles.dart';
import 'package:e_commerce/core/helper/my_navigator.dart';
import 'package:e_commerce/features/Home/views/home_view.dart';
import 'package:e_commerce/features/Home/views/widgets/default_bottom_bar.dart';
import 'package:e_commerce/features/Signup&Login/views/start_view.dart';
import 'package:e_commerce/features/cart/views/cart_view.dart';
import 'package:e_commerce/features/settings/manager/get_user_cubit.dart';
import 'package:e_commerce/features/settings/manager/get_user_state.dart';
import 'package:e_commerce/features/settings/views/my_profile_view.dart';
import 'package:e_commerce/features/settings/views/widgets/check_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => GetUserCubit()..getUser(),
      child: BlocConsumer<GetUserCubit, GetUserState>(
        builder: (context, state) {
          if (state is GetUserLoadingState) {
            return Center(
                child: CircularProgressIndicator(color: AppColors.orange));
          } else {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.lightOrange,
                leading: IconButton(
                    onPressed: () => myNavigator(context, screen: HomeView()),
                    icon: SvgPicture.asset(AppIcons.arrowBackward)),
                title: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(AppImages.person))),
                    ),
                    SizedBox(width: 20),
                    state is GetUserSuccessState
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.user.name!,
                                  style: AppStyles.titleStyle),
                              Text(state.user.email!,
                                  style: AppStyles.onBoardingTextStyle)
                            ],
                          )
                        : state is GetUserErrorState
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state.error,
                                      style: AppStyles.titleStyle),
                                  Text(state.error,
                                      style: AppStyles.onBoardingTextStyle)
                                ],
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                    color: AppColors.orange))
                  ],
                ),
              ),
              backgroundColor: AppColors.lightOrange,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        height: screenHeight,
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            color: AppColors.white),
                        child: Column(
                          children: [
                            InkWell(
                              child: CheckContainer(
                                  label: 'My Profile',
                                  icon: AppIcons.myProfile),
                              onTap: () {
                                myNavigator(context, screen: MyProfileView());
                              },
                            ),
                            InkWell(
                              child: CheckContainer(
                                  label: 'My Orders', icon: AppIcons.myOrders),
                              onTap: () {
                                myNavigator(context, screen: CartView());
                              },
                            ),
                            CheckContainer(
                                label: 'My Favorites',
                                icon: AppIcons.myFavourites),
                            CheckContainer(
                                label: 'Settings', icon: AppIcons.mySettings),
                            Divider(
                                color: AppColors.extraLightOrange,
                                thickness: 1),
                            InkWell(
                              child: CheckContainer(
                                  label: 'Log Out', icon: AppIcons.logout),
                              onTap: () {
                                myNavigator(context, screen: StartView());
                              },
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              bottomNavigationBar: DefaultBottomBar(),
            );
          }
        },
        listener: (context, state) {
          print(state.toString());
        },
      ),
    );
  }
}
