class UpdateState {}

class UpdateInitState extends UpdateState {}

class UpdateLoadingState extends UpdateState {}

class UpdateSuccessState extends UpdateState {
  final String msg;
  UpdateSuccessState(this.msg);
}

class UpdateErrorState extends UpdateState {
  final String error;
  UpdateErrorState(this.error);
}
