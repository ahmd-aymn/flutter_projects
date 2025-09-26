abstract class EndPoints {
  static const String baseUrl =
      "https://nti-ecommerce-api-production.up.railway.app/api/";

  static const String login = "login";
  static const String register = "register";
  static const String update_profile = "update_profile";
  static const String get_user_data = "get_user_data";
  static const String new_slider = "new_slider";
  static const String edit_slider = "slider/1";
  static const String get_sliders = "sliders";
  static const String new_category = "new_category";
  static const String edit_category = "category/2";
  static const String delete_category = "category/1";
  static const String get_categories = "categories";
  static const String place_order = "place_order";
  static const String cancel_order = "orders/cancel/1";
  static const String complete_order = "orders/complete/3";
  static const String orders = "orders";
  static const String new_product = "new_product";
  static const String add_to_favorite = "add_to_favorite";
  static const String edit_product = "product/3";
  static const String get_products = "products";
  static const String search = "products/search?q=p";
  static const String best_seller_products = "best_seller_products";
  static const String top_rated_products = "top_rated_products";
}
