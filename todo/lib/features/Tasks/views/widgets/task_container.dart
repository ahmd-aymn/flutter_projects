import 'package:flutter/material.dart';
import '../../../../core/app_assets/AppColors.dart';

// ignore: must_be_immutable
class TaskContainer extends StatelessWidget {
  String? title;
  String? description;
  TaskContainer({super.key, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 90,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.lightBlue,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: AppColors.semiPurple,
                spreadRadius: 0,
                blurRadius: 6,
                offset: Offset(0, 3))
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                title!,
                style: TextStyle(color: AppColors.semiPurple, fontSize: 12),
              )),
              Text('11/03/2025\n  05:00 PM',
                  style: TextStyle(color: AppColors.semiPurple, fontSize: 9))
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(description!),
            ],
          )
        ],
      ),
    );
  }
}
