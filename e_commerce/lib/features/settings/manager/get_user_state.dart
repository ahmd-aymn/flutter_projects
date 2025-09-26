import '../data/models/user_response_model.dart';

class GetUserState {}

class GetUserInitState extends GetUserState {}

class GetUserLoadingState extends GetUserState {}

class GetUserSuccessState extends GetUserState {
  final User user;
  GetUserSuccessState(this.user);
}

class GetUserErrorState extends GetUserState {
  final String error;
  GetUserErrorState(this.error);
}
