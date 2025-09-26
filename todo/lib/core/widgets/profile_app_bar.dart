import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/Updates/views/settings_view.dart';
import '../../features/Updates/manager/get_users/get_users_cubit.dart';
import '../../features/Updates/manager/get_users/get_users_state.dart';
import 'OptionContainer.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => GetUserCubit()..getUser(),
      child: Container(
        margin: EdgeInsets.only(right: 20, left: 20),
        width: (screenWidth * (2 / 3)),
        child: Row(
          children: [
            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SettingsView();
              }));
            }, child: BlocBuilder<GetUserCubit, GetUserState>(
              builder: (context, state) {
                if (state is GetUserSuccessState) {
                  return Column(
                    children: [
                      OptionContainer(
                          label: "Hello!", option: state.userInfo.username!)
                    ],
                  );
                } else {
                  return SizedBox();
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
