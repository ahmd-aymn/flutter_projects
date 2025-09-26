class AddCategoryState {}

class AddCategoryLoadingState extends AddCategoryState {}

class AddCategorySuccessState extends AddCategoryState {
  final String msg;
  AddCategorySuccessState(this.msg);
}

class AddCategoryErrorState extends AddCategoryState {
  final String error;
  AddCategoryErrorState(this.error);
}
