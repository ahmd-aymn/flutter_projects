import 'package:flutter/painting.dart';

import 'app_colors.dart';

abstract class AppStyles {
  static final TextStyle labelStyle = TextStyle(
      fontWeight: FontWeight.bold, color: AppColors.darkOrange, fontSize: 16);
  static final TextStyle nameHintStyle = TextStyle(
      fontSize: 14,
      color: AppColors.darkOrange,
      fontWeight: FontWeight.w100,
      fontFamily: 'LeagueSpartan');
  static final TextStyle hintStyle = TextStyle(
      fontSize: 16,
      color: AppColors.darkOrange,
      fontFamily: 'LeagueSpartan',
      fontWeight: FontWeight.w400);
  static final TextStyle titleStyle = TextStyle(
      color: AppColors.white,
      fontSize: 28,
      fontWeight: FontWeight.bold,
      fontFamily: 'titulo screen');
  static final TextStyle onBoardingLabelStyle = TextStyle(
      color: AppColors.orange,
      fontWeight: FontWeight.w900,
      fontSize: 24,
      fontFamily: 'Inter');
  static final TextStyle onBoardingTextStyle = TextStyle(
      color: AppColors.darkOrange,
      fontFamily: 'LeagueSpartan',
      fontWeight: FontWeight.w500,
      fontSize: 16);
  static final TextStyle signUpRules = TextStyle(
      fontSize: 11, fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w300);
  static final TextStyle orangeSignUpRules = TextStyle(
      fontSize: 11,
      fontFamily: 'LeagueSpartan',
      fontWeight: FontWeight.w500,
      color: AppColors.orange);
  static final TextStyle itemLabel = TextStyle(
      color: AppColors.darkOrange,
      fontFamily: 'LeagueSpartan',
      fontSize: 12,
      fontWeight: FontWeight.w400);
  static final TextStyle itemDescription = TextStyle(
      color: AppColors.darkOrange,
      fontFamily: 'LeagueSpartan',
      fontSize: 12,
      fontWeight: FontWeight.w300);
  static final TextStyle priceStyle = TextStyle(
      color: AppColors.orange,
      fontWeight: FontWeight.w400,
      fontFamily: 'LeagueSpartan',
      fontSize: 18);
  static final TextStyle itemPriceStyle = TextStyle(
      color: AppColors.orange,
      fontWeight: FontWeight.w700,
      fontFamily: 'LeagueSpartan',
      fontSize: 24);
  static final TextStyle itemPageLabel = TextStyle(
      color: AppColors.darkOrange,
      fontWeight: FontWeight.w500,
      fontFamily: 'LeagueSpartan',
      fontSize: 20);
  static final TextStyle profileLabelStyle = TextStyle(
      color: AppColors.darkOrange,
      fontWeight: FontWeight.w500,
      fontFamily: 'LeagueSpartan',
      fontSize: 24);
}
