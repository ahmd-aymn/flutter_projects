import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/app_assets/AppColors.dart';
import '../../../core/app_assets/AppImages.dart';
import '../../../core/helper/my_navigator.dart';
import '../../../core/widgets/ProfilePicture.dart';
import '../../../core/widgets/TextContainer.dart';
import '../../OnBoarding/views/widgets/message_with_button.dart';
import '../../Tasks/views/home_view.dart';
import '../manager/update_profile/update_profile_cubit.dart';
import '../manager/update_profile/update_profile_state.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: Builder(builder: (context) {
            return Column(
              children: [
                ProfilePicture(
                    height: 250,
                    width: double.infinity,
                    image: AssetImage(AppImages.Palestine)),
                SizedBox(height: 20),
                Builder(
                    builder: (context) => Column(
                          children: [
                            TextContainer(
                              label: "Username",
                              hint: "Type your name here",
                              textController: UpdateProfileCubit.get(context)
                                  .nameController,
                              borderColor: AppColors.green,
                            ),
                            SizedBox(height: 10),
                          ],
                        )),
                SizedBox(height: 10),
                BlocConsumer<UpdateProfileCubit, UpdateState>(
                    builder: (context, state) {
                  if (state is UpdateLoadingState) {
                    return CircularProgressIndicator(color: AppColors.green);
                  } else {
                    return Column(
                      children: [
                        state is UpdateSuccessState
                            ? MessageWithButton(
                                message: state.msg,
                                buttonLabel: "Profile",
                                messageColor: AppColors.green,
                                onPressed: () {
                                  myNavigator(context, screen: Home());
                                })
                            : state is UpdateErrorState
                                ? MessageWithButton(
                                    message: state.error,
                                    buttonLabel: 'Update',
                                    messageColor: AppColors.red,
                                    onPressed: () {
                                      UpdateProfileCubit.get(context).update();
                                    })
                                : MessageWithButton(
                                    message: '',
                                    buttonLabel: 'Update',
                                    onPressed: () {
                                      UpdateProfileCubit.get(context).update();
                                    })
                      ],
                    );
                  }
                }, listener: (context, state) {
                  print(state.toString());
                }),
              ],
            );
          }),
        ),
      ),
    );
  }
}
