import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/features/Updates/views/change_password_view.dart';
import 'package:todo/features/Updates/views/update_profile_view.dart';
import 'package:todo/features/Updates/views/widgets/SettingContainer.dart';
import '../../../core/app_assets/AppColors.dart';
import '../../../core/app_assets/AppIcons.dart';
import '../../../core/helper/my_navigator.dart';
import '../../../core/widgets/profile_app_bar.dart';
import '../../Tasks/views/home_view.dart';
import 'multiple_settings_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              SizedBox(width: 20),
              InkWell(
                  onTap: () {
                    myNavigator(context, screen: Home());
                  },
                  child: SvgPicture.asset(AppIcons.curvearrowbackward)),
              ProfileAppBar(),
            ],
          ),
          SizedBox(height: 40),
          SettingContainer(
              label: 'Update Profile',
              icon: AppIcons.person2,
              screen: UpdateProfileView()),
          SizedBox(height: 20),
          SettingContainer(
              label: 'Change Password',
              icon: AppIcons.lock,
              screen: ChangePasswordView()),
          SizedBox(height: 20),
          SettingContainer(
              label: 'Settings', icon: AppIcons.settings, screen: Settings()),
        ],
      ),
    );
  }
}
