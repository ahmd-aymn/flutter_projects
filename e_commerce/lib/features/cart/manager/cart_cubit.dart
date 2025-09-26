import 'package:e_commerce/features/cart/data/repo/cart_repo.dart';
import 'package:e_commerce/features/cart/manager/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());
  static CartCubit get(context) => BlocProvider.of(context);

  void addItem(
      {required String label,
      required String image,
      required double price}) async {
    emit(AddCartLoadingState());
    Future.delayed(Duration(seconds: 1));
    CartRepo cartRepo = CartRepo();
    var response = cartRepo.addItem(label: label, price: price, image: image);
    response.fold((error) {
      emit(AddCartErrorState(error));
    }, (r) {
      emit(AddCartSuccessState());
    });
  }

  void getItems() async {
    emit(GetCartLoadingState());
    Future.delayed(Duration(seconds: 1));
    CartRepo cartRepo = CartRepo();
    var response = cartRepo.getItems();
    response.fold((error) {
      emit(GetCartErrorState(error));
    }, (items) {
      emit(GetCartSuccessState(items));
    });
  }
}
