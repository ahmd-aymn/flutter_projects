/*
File: News list builder
Description: file to handle logic of fetching news data from api
and isolate logic from view files
*/

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/views/news_list_view.dart';

class NewsListBuilder extends StatefulWidget {
  final String category;
  const NewsListBuilder({super.key, required this.category});

  @override
  State<NewsListBuilder> createState() => _NewsListBuilderState();
}

class _NewsListBuilderState extends State<NewsListBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getLatestNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    /*
    Widget to build future list coming from internet through API.
    */

    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text('Opps!! There is an error. Try again later.'),
            ),
          );
        }
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: CircularProgressIndicator(color: Colors.orange)),
        );
      },
    );
    /* return isLoading
        ? SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(color: Colors.orange),
            ),
          )
        : articles.isNotEmpty
        ? NewsListView(articles: articles)
        : SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text('Opps!! There is an error. Try again later.'),
            ),
          ); */
  }
}
