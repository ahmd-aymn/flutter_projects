import 'package:e_commerce/core/app_assets/app_colors.dart';
import 'package:e_commerce/core/app_assets/app_icons.dart';
import 'package:e_commerce/core/app_assets/app_strings.dart';
import 'package:e_commerce/core/app_assets/app_styles.dart';
import 'package:e_commerce/features/Signup&Login/manager/login/login_cubit.dart';
import 'package:e_commerce/features/Signup&Login/views/start_view.dart';
import 'package:e_commerce/features/Signup&Login/views/widgets/default_form_field.dart';
import 'package:e_commerce/features/Signup&Login/views/widgets/message_with_button.dart';
import 'package:e_commerce/features/Signup&Login/views/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helper/my_navigator.dart';
import '../../../core/widgets/body_container.dart';
import '../../Home/views/home_view.dart';
import '../manager/login/login_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LoginCubit(),
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
          title: Text(AppStrings.hello, style: AppStyles.titleStyle),
          centerTitle: true,
        ),
        backgroundColor: AppColors.lightOrange,
        body: SingleChildScrollView(
          child: Column(
            children: [
              BodyContainer(
                height: screenHeight,
                child: Builder(builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text('Welcome', style: AppStyles.labelStyle),
                      SizedBox(height: 40),
                      Text('Email', style: AppStyles.labelStyle),
                      SizedBox(height: 10),
                      DefaultFormField(
                          hint: 'Enter email here',
                          hintStyle: AppStyles.nameHintStyle,
                          controller: LoginCubit.get(context).emailController),
                      SizedBox(height: 20),
                      Text('Password', style: AppStyles.labelStyle),
                      SizedBox(height: 10),
                      PasswordField(
                          hint: 'enter password',
                          hintStyle: AppStyles.hintStyle,
                          suffixIcon: SvgPicture.asset(AppIcons.closedEye),
                          controller:
                              LoginCubit.get(context).passwordController),
                      SizedBox(height: 40),
                      BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          print(state.toString());
                          if (state is LoginSuccessState) {
                            myNavigator(context, screen: HomeView());
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoadingState) {
                            return Center(
                                child: CircularProgressIndicator(
                                    color: AppColors.orange));
                          } else {
                            return Column(
                              children: [
                                state is LoginSuccessState
                                    ? MessageWithButton(
                                        message: 'Successful Login',
                                        buttonLabel: "Home",
                                        messageColor: Colors.green,
                                        onPressed: () {
                                          myNavigator(context,
                                              screen: HomeView());
                                        })
                                    : state is LoginErrorState
                                        ? MessageWithButton(
                                            message: state.error,
                                            buttonLabel: 'Log In',
                                            messageColor: Colors.red,
                                            onPressed: () {
                                              LoginCubit.get(context).login();
                                            })
                                        : MessageWithButton(
                                            message: '',
                                            buttonLabel: 'Log In',
                                            onPressed: () {
                                              LoginCubit.get(context).login();
                                            })
                              ],
                            );
                          }
                        },
                      ),
                      SizedBox(height: 10)
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
