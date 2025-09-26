import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/features/OnBoarding/views/widgets/message_with_button.dart';
import '../../../core/app_assets/AppColors.dart';
import '../../../core/app_assets/AppImages.dart';
import '../../../core/helper/my_navigator.dart';
import '../../../core/widgets/ProfilePicture.dart';
import '../../../core/widgets/TextContainer.dart';
import '../../../core/widgets/image_manager/image_manager_view.dart';
import '../manager/register/register_cubit.dart';
import '../manager/register/register_state.dart';
import 'login_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SingleChildScrollView(
          child: Builder(builder: (context) {
            return SafeArea(
              top: true,
              child: Column(
                children: [
                  ImageManagerView(
                    onSelected: (XFile image) {},
                    selectedImageBuilder: (XFile image) {
                      return ProfilePicture(
                          height: (screenHeight / 3),
                          width: double.infinity,
                          image: FileImage(File(image.path)));
                    },
                    unSelectedImageBuilder: () {
                      return ProfilePicture(
                          height: (screenHeight / 3),
                          width: double.infinity,
                          image: AssetImage(AppImages.Palestine));
                    },
                  ),
                  SizedBox(height: 20),
                  TextContainer(
                    width: double.infinity,
                    label: 'Name',
                    hint: 'Type your name here',
                    borderColor: AppColors.green,
                    textController: RegisterCubit.get(context).nameController,
                  ),
                  SizedBox(height: 20),
                  TextContainer(
                    width: double.infinity,
                    label: 'Password',
                    hint: 'Type your password here',
                    borderColor: AppColors.green,
                    textController:
                        RegisterCubit.get(context).passwordController,
                  ),
                  SizedBox(height: 20),
                  TextContainer(
                    width: double.infinity,
                    label: 'Confirm Password',
                    hint: 'Repeat the password',
                    borderColor: AppColors.green,
                    textController: RegisterCubit.get(context).confirmPassword,
                  ),
                  SizedBox(height: 10),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      print(state.toString());
                    },
                    builder: (context, state) {
                      if (state is RegisterLoadingState) {
                        return CircularProgressIndicator(
                            color: AppColors.green);
                      } else {
                        return Column(
                          children: [
                            state is RegisterSuccessState
                                ? MessageWithButton(
                                    message: state.msg,
                                    buttonLabel: "Login",
                                    messageColor: AppColors.green,
                                    onPressed: () {
                                      myNavigator(context, screen: LoginView());
                                    })
                                : state is RegisterErrorState
                                    ? MessageWithButton(
                                        message: state.error,
                                        buttonLabel: 'Register',
                                        messageColor: AppColors.red,
                                        onPressed: () {
                                          RegisterCubit.get(context).register();
                                        })
                                    : MessageWithButton(
                                        message: '',
                                        buttonLabel: 'Register',
                                        onPressed: () {
                                          RegisterCubit.get(context).register();
                                        })
                          ],
                        );
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      myNavigator(context, screen: LoginView());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?  "),
                        Text(
                          "Login",
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
