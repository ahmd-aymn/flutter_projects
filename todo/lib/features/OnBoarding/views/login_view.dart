import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/OnBoarding/views/register_view.dart';
import 'package:todo/features/OnBoarding/views/widgets/message_with_button.dart';
import '../../../core/app_assets/AppColors.dart';
import '../../../core/app_assets/AppImages.dart';
import '../../../core/helper/my_navigator.dart';
import '../../../core/widgets/ProfilePicture.dart';
import '../../../core/widgets/TextContainer.dart';
import '../../Tasks/views/home_view.dart';
import '../manager/login/login_cubit.dart';
import '../manager/login/login_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Builder(builder: (context) {
              return Column(
                children: [
                  ProfilePicture(
                      height: (screenHeight / 3),
                      width: double.infinity,
                      image: AssetImage(AppImages.Palestine)),
                  SizedBox(height: 20),
                  TextContainer(
                    label: 'Name',
                    hint: 'Type your name here',
                    borderColor: AppColors.green,
                    textController: LoginCubit.get(context).nameController,
                  ),
                  SizedBox(height: 20),
                  TextContainer(
                    label: 'Password',
                    hint: 'Type your password here',
                    borderColor: AppColors.green,
                    textController: LoginCubit.get(context).passwordController,
                  ),
                  SizedBox(height: 10),
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      print(state.toString());
                    },
                    builder: (context, state) {
                      if (state is LoginLoadingState) {
                        return CircularProgressIndicator(
                            color: AppColors.green);
                      } else {
                        return Column(
                          children: [
                            state is LoginSuccessState
                                ? MessageWithButton(
                                    message: 'Successful Login',
                                    buttonLabel: "Profile",
                                    messageColor: AppColors.green,
                                    onPressed: () {
                                      myNavigator(context, screen: Home());
                                    })
                                : state is LoginErrorState
                                    ? MessageWithButton(
                                        message: state.error,
                                        buttonLabel: 'Login',
                                        messageColor: AppColors.red,
                                        onPressed: () {
                                          LoginCubit.get(context).login();
                                        })
                                    : MessageWithButton(
                                        message: '',
                                        buttonLabel: 'Login',
                                        onPressed: () {
                                          LoginCubit.get(context).login();
                                        })
                          ],
                        );
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      myNavigator(context, screen: RegisterView());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?  "),
                        Text(
                          "Register",
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
