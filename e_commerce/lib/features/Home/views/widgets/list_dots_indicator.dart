import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/app_assets/app_colors.dart';

class DefaultDotsIndicator extends StatefulWidget {
  final PageController pageController;
  const DefaultDotsIndicator({super.key, required this.pageController});

  @override
  State<DefaultDotsIndicator> createState() => _DefaultDotsIndicatorState();
}

class _DefaultDotsIndicatorState extends State<DefaultDotsIndicator> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SmoothPageIndicator(
        controller: widget.pageController,
        count: 3,
        effect: SlideEffect(
          activeDotColor: AppColors.orange,
          dotColor: AppColors.extraLightOrange,
          dotHeight: 4,
          dotWidth: 20,
          spacing: 8,
          radius: 12,
        ),
        onDotClicked: (index) {
          widget.pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
