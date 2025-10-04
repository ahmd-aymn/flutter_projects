/*
File: News View
Description: view file to view the vertical list of news
*/

import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;
  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    /*
    Widget to build list with lazy loading like listview.
    We use it instead of listview because we need to expand the
    vertical list in the rest of the screen and listview widget
    wrapped with expanded widget isn't allowed directly in
    slivers as it will throw exception.
    */
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => NewsTile(articleModel: articles[index]),
        childCount: articles.length,
      ),
    );
  }
}
