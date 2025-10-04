/*
File: News Serviece
Description: logic file to get requests from internet through API
and get the list of articles
*/

import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticleModel>> getLatestNews({required String category}) async {
    try {
      Response response = await dio.get(category);
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['results'];
      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
