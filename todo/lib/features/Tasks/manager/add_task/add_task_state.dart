class AddTaskState {}

class AddTaskLoadingState extends AddTaskState {}

class AddTaskSuccessState extends AddTaskState {
  final String msg;
  AddTaskSuccessState(this.msg);
}

class AddTaskErrorState extends AddTaskState {
  final String error;
  AddTaskErrorState(this.error);
}
