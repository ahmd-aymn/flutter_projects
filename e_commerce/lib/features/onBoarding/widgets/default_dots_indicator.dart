import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/app_assets/app_colors.dart';

class DefaultDotsIndicator extends StatefulWidget {
  final PageController pageController;
  final int length;
  const DefaultDotsIndicator(
      {super.key, required this.pageController, required this.length});

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
        count: widget.length,
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

/*Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: SmoothPageIndicator(
            controller: pageController, // PageController
            count: screens.length, // Number of pages
            effect: WormEffect( // Choose your effect
              activeDotColor: Colors.blue,
              dotColor: Colors.grey,
              dotHeight: 10,
              dotWidth: 10,
              spacing: 8,
            ),
            onDotClicked: (index) {
              pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),*/
