import 'package:e_commerce/features/Home/data/models/get_categories_response_model.dart';

class GetCategoriesState {}

class GetCategoriesLoadingState extends GetCategoriesState {}

class GetCategoriesSuccessState extends GetCategoriesState {
  final List<Categories> categories;
  GetCategoriesSuccessState(this.categories);
}

class GetCategoriesErrorState extends GetCategoriesState {
  final String error;
  GetCategoriesErrorState(this.error);
}
