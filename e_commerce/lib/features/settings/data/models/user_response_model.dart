import '../../../Home/data/models/get_categories_response_model.dart';

class GetUserModel {
  bool? status;
  User? user;

  GetUserModel({this.status, this.user});

  GetUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? email;
  List<Products>? favoriteProducts;
  int? id;
  Null imagePath;
  String? name;
  String? phone;

  User(
      {this.email,
      this.favoriteProducts,
      this.id,
      this.imagePath,
      this.name,
      this.phone});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    if (json['favorite_products'] != null) {
      favoriteProducts = <Products>[];
      json['favorite_products'].forEach((v) {
        favoriteProducts!.add(Products.fromJson(v));
      });
    }
    id = json['id'];
    imagePath = json['image_path'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    if (favoriteProducts != null) {
      data['favorite_products'] =
          favoriteProducts!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['image_path'] = imagePath;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}
