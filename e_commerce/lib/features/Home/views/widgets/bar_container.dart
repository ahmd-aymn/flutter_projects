import 'package:flutter/material.dart';

class BarContainer extends StatelessWidget {
  final String image;
  const BarContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 108,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(image))),
    );
  }
}
