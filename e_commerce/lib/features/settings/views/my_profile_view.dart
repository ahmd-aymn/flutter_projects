import 'package:e_commerce/core/app_assets/app_colors.dart';
import 'package:e_commerce/core/app_assets/app_icons.dart';
import 'package:e_commerce/core/app_assets/app_images.dart';
import 'package:e_commerce/core/app_assets/app_styles.dart';
import 'package:e_commerce/core/helper/my_navigator.dart';
import 'package:e_commerce/core/widgets/body_container.dart';
import 'package:e_commerce/features/Signup&Login/views/widgets/default_form_field.dart';
import 'package:e_commerce/features/settings/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.lightOrange,
      appBar: AppBar(
        backgroundColor: AppColors.lightOrange,
        leading: IconButton(
            onPressed: () {
              myNavigator(context, screen: ProfileView());
            },
            icon: SvgPicture.asset(AppIcons.arrowBackward)),
        title: Text('My Profile', style: AppStyles.titleStyle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            BodyContainer(
                height: screenHeight,
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(color: AppColors.white),
                      child: Container(
                        width: 127,
                        height: 127,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(AppImages.person))),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 118,
                              top: 118,
                              child: Container(
                                padding: EdgeInsets.all(3),
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                    color: AppColors.orange,
                                    borderRadius: BorderRadius.circular(10)),
                                child: SvgPicture.asset(AppIcons.cam),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Full Name', style: AppStyles.labelStyle),
                        SizedBox(height: 10),
                        DefaultFormField(
                            hint: 'Enter your name',
                            hintStyle: AppStyles.hintStyle),
                        SizedBox(height: 20),
                        Text('Phone Number', style: AppStyles.labelStyle),
                        SizedBox(height: 10),
                        DefaultFormField(
                            hint: 'Enter your phone',
                            hintStyle: AppStyles.hintStyle),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
