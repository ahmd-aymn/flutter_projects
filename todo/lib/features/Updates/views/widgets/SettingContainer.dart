import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/app_assets/AppIcons.dart';
import '../../../../core/helper/my_navigator.dart';
import '../../../../core/widgets/DefaultContainer.dart';

class SettingContainer extends StatelessWidget {
  final String label;
  final String icon;
  final Widget screen;
  const SettingContainer(
      {super.key,
      required this.label,
      required this.icon,
      required this.screen});

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      width: double.infinity,
      child: InkWell(
        child: Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: 10),
            Expanded(child: Text(label)),
            SvgPicture.asset(AppIcons.curvearrowforward)
          ],
        ),
        onTap: () {
          myNavigator(context, screen: screen);
        },
      ),
    );
  }
}
