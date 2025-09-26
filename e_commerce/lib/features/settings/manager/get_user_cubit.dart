import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/get_user_repo.dart';
import 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit() : super(GetUserState());
  final TextEditingController nameController = TextEditingController();
  static GetUserCubit get(context) => BlocProvider.of(context);
  GetUsersRepo getUsersRepo = GetUsersRepo();

  void getUser() async {
    var response = await getUsersRepo.getUser();
    response.fold((error) {
      emit(GetUserErrorState(error));
    }, (user) {
      emit(GetUserSuccessState(user));
    });
  }
}
