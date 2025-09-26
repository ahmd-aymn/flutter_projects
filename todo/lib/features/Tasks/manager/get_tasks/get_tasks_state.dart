import '../../data/models/get_task_model.dart';

class GetTasksState {}

class GetTasksLoadingState extends GetTasksState {}

class GetTasksSuccessState extends GetTasksState {
  final List<TaskModel> tasks;
  GetTasksSuccessState(this.tasks);
}

class GetTasksErrorState extends GetTasksState {
  final String error;
  GetTasksErrorState(this.error);
}
