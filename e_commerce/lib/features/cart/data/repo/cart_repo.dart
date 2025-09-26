import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/cart/views/widgets/cart_item.dart';

List<CartItem> items = [];

class CartRepo {
  CartRepo._internal();
  static final CartRepo _instance = CartRepo._internal();
  factory CartRepo() => _instance;

  Either<String, void> addItem(
      {required String label, required double price, required String image}) {
    try {
      CartItem item = CartItem(label: label, price: price, image: image);
      items.add(item);
    } catch (e) {
      return left(e.toString());
    }
    return right(0);
  }

  Either<String, List<CartItem>> getItems() {
    try {} catch (e) {
      return left(e.toString());
    }
    return right(items);
  }
}
