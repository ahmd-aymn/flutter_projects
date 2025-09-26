import 'package:todo/features/Updates/data/models/get_user_model.dart';

class GetUserState {}

class GetUserInitState extends GetUserState {}

class GetUserLoadingState extends GetUserState {}

class GetUserSuccessState extends GetUserState {
  final UserInfo userInfo;
  GetUserSuccessState(this.userInfo);
}

class GetUserErrorState extends GetUserState {
  final String error;
  GetUserErrorState(this.error);
}
