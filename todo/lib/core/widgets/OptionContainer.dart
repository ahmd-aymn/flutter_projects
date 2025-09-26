import 'package:flutter/material.dart';
import '../app_assets/AppImages.dart';

class OptionContainer extends StatelessWidget {
  final String label;
  final String option;
  const OptionContainer({super.key, required this.label, required this.option});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(AppImages.Palestine),
                    fit: BoxFit.cover))),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 3),
            Text(label,
                style: TextStyle(fontSize: 9, color: Color(0XFF6E6A7C))),
            SizedBox(height: 3),
            Text(option,
                style: TextStyle(fontSize: 14, color: Color(0XFF24252C)))
          ],
        )
      ],
    );
  }
}
