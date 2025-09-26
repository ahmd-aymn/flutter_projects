import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/add_task_repo.dart';
import 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskState());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  static AddTaskCubit get(context) => BlocProvider.of(context);
  void addTask() async {
    AddTaskRepo addTaskRepo = AddTaskRepo();
    emit(AddTaskLoadingState());
    await Future.delayed(Duration(seconds: 1));
    var response = await addTaskRepo.addTask(
        title: titleController.text, description: descriptionController.text);
    response.fold((error) {
      emit(AddTaskErrorState(error));
    }, (msg) {
      emit(AddTaskSuccessState(msg));
    });
  }
}
