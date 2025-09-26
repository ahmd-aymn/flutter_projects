import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/OnBoarding/views/login_view.dart';
import 'package:todo/features/OnBoarding/views/widgets/message_with_button.dart';
import '../../../core/app_assets/AppColors.dart';
import '../../../core/app_assets/AppImages.dart';
import '../../../core/helper/my_navigator.dart';
import '../../../core/widgets/ProfilePicture.dart';
import '../../../core/widgets/TextContainer.dart';
import '../manager/change_password/change_password_cubit.dart';
import '../manager/change_password/change_password_state.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
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
                              label: "Old Password",
                              hint: "Type old password here",
                              textController: ChangePasswordCubit.get(context)
                                  .currentPasswordController,
                              borderColor: AppColors.green,
                            ),
                            SizedBox(height: 20),
                            TextContainer(
                              label: "New Password",
                              hint: "Type new password here",
                              textController: ChangePasswordCubit.get(context)
                                  .newPasswordController,
                              borderColor: AppColors.green,
                            ),
                            SizedBox(height: 20),
                            TextContainer(
                              label: "Confirm Password",
                              hint: "Confirm password here",
                              textController: ChangePasswordCubit.get(context)
                                  .confirmPasswordController,
                              borderColor: AppColors.green,
                            ),
                            SizedBox(height: 10),
                          ],
                        )),
                SizedBox(height: 10),
                BlocConsumer<ChangePasswordCubit, ChangeState>(
                    builder: (context, state) {
                  if (state is ChangeLoadingState) {
                    return CircularProgressIndicator(color: AppColors.green);
                  } else {
                    return Column(
                      children: [
                        state is ChangeSuccessState
                            ? MessageWithButton(
                                message: state.msg,
                                messageColor: AppColors.green,
                                onPressed: () {
                                  myNavigator(context, screen: LoginView());
                                },
                                buttonLabel: 'Login')
                            : state is ChangeErrorState
                                ? MessageWithButton(
                                    message: state.error,
                                    messageColor: AppColors.red,
                                    onPressed: () {
                                      ChangePasswordCubit.get(context).change();
                                    },
                                    buttonLabel: 'Update')
                                : MessageWithButton(
                                    message: '',
                                    onPressed: () {
                                      ChangePasswordCubit.get(context).change();
                                    },
                                    buttonLabel: 'Update')
                      ],
                    );
                  }
                }, listener: (context, state) {
                  print(state.toString());
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
