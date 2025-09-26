import 'dart:ui';

import 'package:e_commerce/core/app_assets/app_colors.dart';
import 'package:e_commerce/core/app_assets/app_icons.dart';
import 'package:e_commerce/features/onBoarding/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LaunchView extends StatefulWidget {
  const LaunchView({super.key});

  @override
  State<LaunchView> createState() => _LaunchViewState();
}

class _LaunchViewState extends State<LaunchView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _blurAnimation;
  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Duration of the animation
    );

    // Create a Tween for the blur intensity
    _blurAnimation = Tween<double>(begin: 5.0, end: 0.0).animate(_controller);

    // Start the animation
    _controller.forward();

    // Navigate to the next screen after the animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OnBoardingView()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightOrange,
      body: AnimatedBuilder(
          builder: (context, child) {
            return ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: _blurAnimation.value,
                sigmaY: _blurAnimation.value,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: SvgPicture.asset(AppIcons.yum)),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('YUM',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                              color: AppColors.orange,
                              fontFamily: 'Poppins')),
                      Text('QUICK',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                              color: AppColors.white,
                              fontFamily: 'Poppins')),
                    ],
                  ),
                ],
              ),
            );
          },
          animation: _blurAnimation),
    );
  }
}
