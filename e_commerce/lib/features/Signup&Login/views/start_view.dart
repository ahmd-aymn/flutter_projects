import 'package:e_commerce/core/app_assets/app_strings.dart';
import 'package:e_commerce/core/helper/my_navigator.dart';
import 'package:e_commerce/features/Signup&Login/views/login_view.dart';
import 'package:e_commerce/features/Signup&Login/views/signup_view.dart';
import 'package:e_commerce/features/Signup&Login/views/widgets/reg_log_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/app_assets/app_colors.dart';
import '../../../core/app_assets/app_icons.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight * (1 / 6)),
          SvgPicture.asset(AppIcons.yum2),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('YUM',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      color: AppColors.lightOrange,
                      fontFamily: 'Poppins')),
              Text('QUICK',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      color: AppColors.white,
                      fontFamily: 'Poppins')),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Lorem ipsum dolor sit amet, consectetur \n        adipiscing elit, sed do eiusmod.',
                  style: TextStyle(
                      color: AppColors.white,
                      fontFamily: 'LeagueSpartan',
                      fontWeight: FontWeight.w500))
            ],
          ),
          SizedBox(height: 20),
          RegLogButton(
              label: AppStrings.login,
              textColor: AppColors.orange,
              buttonColor: AppColors.lightOrange,
              onPressed: () {
                myNavigator(context, screen: LoginView());
              }),
          RegLogButton(
              label: AppStrings.signup,
              textColor: AppColors.orange,
              buttonColor: AppColors.extraLightOrange,
              onPressed: () {
                myNavigator(context, screen: SignupView());
              }),
        ],
      ),
    );
  }
}
