import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/change_password_repo.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangeState> {
  ChangePasswordCubit() : super(ChangeState());
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  static ChangePasswordCubit get(context) => BlocProvider.of(context);
  ChangePasswordRepo changePasswordRepo = ChangePasswordRepo();

  void change() async {
    emit(ChangeLoadingState());
    await Future.delayed(Duration(seconds: 1));
    var response = await changePasswordRepo.change(
        currentPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
        confirmPassword: confirmPasswordController.text);

    response.fold((error) {
      emit(ChangeErrorState(error));
    }, (msg) {
      emit(ChangeSuccessState(msg));
    });
  }
}
