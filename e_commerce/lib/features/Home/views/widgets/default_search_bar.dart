import 'package:flutter/material.dart';

import '../../../../core/app_assets/app_colors.dart';

class DefaultSearchBar extends StatelessWidget {
  const DefaultSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Center(
          child: SizedBox(
            width: 240,
            height: 20,
            child: TextField(
              cursorColor: AppColors.black,
              cursorHeight: 10,
              cursorWidth: 1,
              style: TextStyle(fontSize: 8),
              decoration: InputDecoration(
                fillColor: AppColors.white,
                filled: true,
                contentPadding: EdgeInsets.only(left: 10),
                hintText: 'Search',
                hintStyle: TextStyle(color: AppColors.darkOrange, fontSize: 8),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.white),
                    borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.white),
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
