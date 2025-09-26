class UserResponseModel {
  String? accessToken;
  String? refreshToken;
  bool? status;
  UserModel? user;

  UserResponseModel(
      {this.accessToken, this.refreshToken, this.status, this.user});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    status = json['status'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class UserModel {
  String? email;
  int? id;
  Null imagePath;
  String? name;
  String? phone;

  UserModel({this.email, this.id, this.imagePath, this.name, this.phone});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    if (json['favorite_products'] != null) {
      json['favorite_products'].forEach((v) {});
    }
    id = json['id'];
    imagePath = json['image_path'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['id'] = id;
    data['image_path'] = imagePath;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}
