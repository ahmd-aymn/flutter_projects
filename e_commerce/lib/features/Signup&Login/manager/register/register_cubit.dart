import 'package:e_commerce/features/Signup&Login/manager/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/register_repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());
  RegisterRepo registerRepo = RegisterRepo();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  static RegisterCubit get(context) => BlocProvider.of(context);

  void register() async {
    emit(RegisterLoadingState());
    await Future.delayed(Duration(seconds: 1));
    var response = await registerRepo.register(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      confirmPassword: confirmPassword.text,
    );
    response.fold((error) {
      emit(RegisterErrorState(error));
    }, (msg) {
      emit(RegisterSuccessState(msg));
    });
  }
}
