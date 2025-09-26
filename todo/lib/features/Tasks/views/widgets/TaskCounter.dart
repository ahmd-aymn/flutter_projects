import 'package:flutter/material.dart';
import '../../../../core/app_assets/AppColors.dart';
import 'MyButtons.dart';

class TaskCounter extends StatelessWidget {
  final String label;
  final int number;
  const TaskCounter({super.key, required this.label, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, bottom: 20),
      child: Row(
        children: [
          Text(label),
          SizedBox(
            width: 50,
          ),
          MyButtons(
            width: 15,
            height: 17,
            color: AppColors.semiGreen,
            radius: 5,
            child: Column(
              children: [
                Text(
                  number.toString(),
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
