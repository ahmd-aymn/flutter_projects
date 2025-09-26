import 'package:e_commerce/features/Home/data/repo/get_categories_repo.dart';
import 'package:e_commerce/features/Home/manager/get_categories/get_categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit() : super(GetCategoriesState());
  static GetCategoriesCubit get(context) => BlocProvider.of(context);

  void getCategories() async {
    emit(GetCategoriesLoadingState());
    Future.delayed(Duration(seconds: 1));
    GetCategoriesRepo getCategoriesRepo = GetCategoriesRepo();
    var response = await getCategoriesRepo.getCategories();
    response.fold((error) {
      emit(GetCategoriesErrorState(error));
    }, (categories) {
      emit(GetCategoriesSuccessState(categories));
    });
  }
}
