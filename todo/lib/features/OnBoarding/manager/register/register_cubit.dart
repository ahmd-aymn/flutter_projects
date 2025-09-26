import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/OnBoarding/manager/register/register_state.dart';
import '../../../../core/app_assets/AppImages.dart';
import '../../data/repo/register_repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());
  RegisterRepo registerRepo = RegisterRepo();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final ImageProvider imageProvider = AssetImage(AppImages.Palestine);
  static RegisterCubit get(context) => BlocProvider.of(context);

  void register() async {
    emit(RegisterLoadingState());
    await Future.delayed(Duration(seconds: 1));
    var response = await registerRepo.register(
        username: nameController.text,
        password: passwordController.text,
        confirmPassword: confirmPassword.text,
        image: imageProvider);
    response.fold((error) {
      emit(RegisterErrorState(error));
    }, (msg) {
      emit(RegisterSuccessState(msg));
    });
  }
}
