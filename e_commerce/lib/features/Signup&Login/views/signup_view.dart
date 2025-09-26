import 'package:e_commerce/core/app_assets/app_colors.dart';
import 'package:e_commerce/core/app_assets/app_icons.dart';
import 'package:e_commerce/core/app_assets/app_strings.dart';
import 'package:e_commerce/core/app_assets/app_styles.dart';
import 'package:e_commerce/features/Signup&Login/manager/register/register_cubit.dart';
import 'package:e_commerce/features/Signup&Login/views/start_view.dart';
import 'package:e_commerce/features/Signup&Login/views/widgets/default_form_field.dart';
import 'package:e_commerce/features/Signup&Login/views/widgets/message_with_button.dart';
import 'package:e_commerce/features/Signup&Login/views/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/helper/my_navigator.dart';
import '../../../core/widgets/body_container.dart';
import '../manager/register/register_state.dart';
import 'login_view.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightOrange,
          leading: SizedBox(
              width: 4,
              height: 8,
              child: IconButton(
                  onPressed: () {
                    myNavigator(context, screen: StartView());
                  },
                  icon: SvgPicture.asset(AppIcons.arrowBackward))),
          title: Text(AppStrings.newAccount, style: AppStyles.titleStyle),
          centerTitle: true,
        ),
        backgroundColor: AppColors.lightOrange,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //SizedBox(height: screenHeight / 80),
              BodyContainer(
                child: Builder(builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text('Full Name', style: AppStyles.labelStyle),
                      SizedBox(height: 10),
                      DefaultFormField(
                          hint: 'enter full name here',
                          hintStyle: AppStyles.nameHintStyle,
                          controller:
                              RegisterCubit.get(context).nameController),
                      SizedBox(height: 10),
                      Text('Email', style: AppStyles.labelStyle),
                      SizedBox(height: 10),
                      DefaultFormField(
                          hint: 'example@example.com',
                          hintStyle: AppStyles.hintStyle,
                          controller:
                              RegisterCubit.get(context).emailController),
                      SizedBox(height: 10),
                      Text('Mobile Number', style: AppStyles.labelStyle),
                      SizedBox(height: 10),
                      DefaultFormField(
                          hint: '+ 123 456 789',
                          hintStyle: AppStyles.hintStyle,
                          controller:
                              RegisterCubit.get(context).phoneController),
                      SizedBox(height: 10),
                      Text('Password', style: AppStyles.labelStyle),
                      SizedBox(height: 10),
                      PasswordField(
                          hint: 'enter password',
                          hintStyle: AppStyles.hintStyle,
                          suffixIcon: SvgPicture.asset(AppIcons.closedEye),
                          controller:
                              RegisterCubit.get(context).passwordController),
                      SizedBox(height: 10),
                      Text('Confirm Password', style: AppStyles.labelStyle),
                      SizedBox(height: 10),
                      PasswordField(
                          hint: 'confirm password',
                          hintStyle: AppStyles.hintStyle,
                          suffixIcon: SvgPicture.asset(AppIcons.closedEye),
                          controller:
                              RegisterCubit.get(context).confirmPassword),
                      SizedBox(height: 10),
                      BlocConsumer<RegisterCubit, RegisterState>(
                        listener: (context, state) {
                          print(state.toString());
                        },
                        builder: (context, state) {
                          if (state is RegisterLoadingState) {
                            return Center(
                                child: CircularProgressIndicator(
                              color: AppColors.orange,
                            ));
                          } else {
                            return Column(
                              children: [
                                state is RegisterSuccessState
                                    ? MessageWithButton(
                                        message: state.msg,
                                        buttonLabel: "Log In",
                                        messageColor: Colors.green,
                                        onPressed: () {
                                          myNavigator(context,
                                              screen: LoginView());
                                        })
                                    : state is RegisterErrorState
                                        ? MessageWithButton(
                                            message: state.error,
                                            buttonLabel: 'Sign Up',
                                            messageColor: Colors.red,
                                            onPressed: () {
                                              RegisterCubit.get(context)
                                                  .register();
                                            })
                                        : MessageWithButton(
                                            message: '',
                                            buttonLabel: 'Sign Up',
                                            onPressed: () {
                                              RegisterCubit.get(context)
                                                  .register();
                                            })
                              ],
                            );
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      Center(
                          child: Text('By continuing, you agree to ',
                              style: AppStyles.signUpRules)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(' Terms of Use ',
                              style: AppStyles.orangeSignUpRules),
                          Text('and ', style: AppStyles.signUpRules),
                          Text('Privacy Policy.',
                              style: AppStyles.orangeSignUpRules),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
