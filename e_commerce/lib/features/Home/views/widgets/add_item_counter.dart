import 'package:e_commerce/core/app_assets/app_colors.dart';
import 'package:e_commerce/core/app_assets/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddItemCounter extends StatefulWidget {
  const AddItemCounter({super.key});

  @override
  State<AddItemCounter> createState() => _AddItemCounterState();
}

class _AddItemCounterState extends State<AddItemCounter> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: Container(
              width: 21,
              height: 21,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: AppColors.extraLightOrange, shape: BoxShape.circle),
              child: Divider(color: AppColors.white, thickness: 2)),
          onTap: () {
            setState(() {
              if (counter > 0) {
                counter--;
              } else {
                counter = 0;
              }
            });
          },
        ),
        SizedBox(width: 10),
        Text(counter.toString()),
        SizedBox(width: 10),
        InkWell(
          child: Container(
              width: 21,
              height: 21,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: AppColors.orange, shape: BoxShape.circle),
              child: SvgPicture.asset(AppIcons.add)),
          onTap: () {
            setState(() {
              counter++;
            });
          },
        )
      ],
    );
  }
}
