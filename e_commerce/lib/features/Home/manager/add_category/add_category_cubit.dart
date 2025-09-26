import 'package:e_commerce/features/Home/data/repo/add_category_repo.dart';
import 'package:e_commerce/features/Home/manager/add_category/add_category_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit() : super(AddCategoryState());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  static AddCategoryCubit get(context) => BlocProvider.of(context);
  void addCategory() async {
    AddCategoryRepo addCategoryRepo = AddCategoryRepo();
    emit(AddCategoryLoadingState());
    await Future.delayed(Duration(seconds: 1));
    var response = await addCategoryRepo.addCategory(
        title: titleController.text, description: descriptionController.text);
    response.fold((error) {
      emit(AddCategoryErrorState(error));
    }, (msg) {
      emit(AddCategorySuccessState(msg));
    });
  }
}
