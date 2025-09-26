import 'package:e_commerce/features/cart/views/widgets/cart_item.dart';

class CartState {}

class AddCartState extends CartState {}

class AddCartLoadingState extends AddCartState {}

class AddCartErrorState extends AddCartState {
  final String error;
  AddCartErrorState(this.error);
}

class AddCartSuccessState extends AddCartState {}

class GetCartState extends CartState {}

class GetCartLoadingState extends GetCartState {}

class GetCartErrorState extends GetCartState {
  final String error;
  GetCartErrorState(this.error);
}

class GetCartSuccessState extends GetCartState {
  final List<CartItem> items;
  GetCartSuccessState(this.items);
}
