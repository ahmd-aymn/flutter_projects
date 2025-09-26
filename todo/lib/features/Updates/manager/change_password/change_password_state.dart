
class ChangeState {}

class ChangeInitState extends ChangeState {}

class ChangeLoadingState extends ChangeState {}

class ChangeSuccessState extends ChangeState {
  final String msg;
  ChangeSuccessState(this.msg);
}

class ChangeErrorState extends ChangeState {
  final String error;
  ChangeErrorState(this.error);
}
