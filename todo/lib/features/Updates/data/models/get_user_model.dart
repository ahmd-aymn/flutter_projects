class GetUserModel {
  bool? status;
  UserInfo? user;

  GetUserModel({this.status, this.user});

  GetUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? UserInfo.fromJson(json['user']) : null;
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

class UserInfo {
  int? id;
  Null imagePath;
  String? username;

  UserInfo({this.id, this.imagePath, this.username});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['image_path'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_path'] = imagePath;
    data['username'] = username;
    return data;
  }
}
