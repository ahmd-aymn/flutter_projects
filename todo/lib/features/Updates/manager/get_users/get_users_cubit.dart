import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/get_users_repo.dart';
import 'get_users_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit() : super(GetUserState());
  final TextEditingController nameController = TextEditingController();
  static GetUserCubit get(context) => BlocProvider.of(context);
  GetUsersRepo getUsersRepo = GetUsersRepo();

  void getUser() async {
    var response = await getUsersRepo.getUser();
    response.fold((error) {
      emit(GetUserErrorState(error));
    }, (userInfo) {
      emit(GetUserSuccessState(userInfo));
    });
  }
}
