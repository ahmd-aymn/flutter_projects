/*
File: Article Model
Description: class file has attributes of article and json constructor
to get data from internet.
*/

class ArticleModel {
  final String? image;
  final String? title;
  final String? subTitle;
  final String? link;
  ArticleModel({
    this.link,
    required this.image,
    required this.subTitle,
    required this.title,
  });

  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      link: json['link'],
      image: json['image_url'],
      subTitle: json['title'],
      title: json['description'],
    );
  }
}
