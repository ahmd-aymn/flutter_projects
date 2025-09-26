import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/Updates/data/repo/update_profile_repo.dart';
import 'package:todo/features/Updates/manager/update_profile/update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateState> {
  UpdateProfileCubit() : super(UpdateState());
  final TextEditingController nameController = TextEditingController();
  static UpdateProfileCubit get(context) => BlocProvider.of(context);
  UpdateProfileRepo updateProfileRepo = UpdateProfileRepo();

  void update() async {
    emit(UpdateLoadingState());
    await Future.delayed(Duration(seconds: 1));
    var response =
        await updateProfileRepo.update(username: nameController.text);
    response.fold((error) {
      emit(UpdateErrorState(error));
    }, (msg) {
      emit(UpdateSuccessState(msg));
    });
  }
}
