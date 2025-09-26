import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static LoginCubit get(context) => BlocProvider.of(context);
  LoginRepo loginRepo = LoginRepo();

  void login() async {
    emit(LoginLoadingState());
    await Future.delayed(Duration(seconds: 1));
    var response = await loginRepo.login(
        username: nameController.text, password: passwordController.text);
    response.fold((String error) {
      emit(LoginErrorState(error));
    }, (userModel) {
      emit(LoginSuccessState(userModel));
    });
  }
}
