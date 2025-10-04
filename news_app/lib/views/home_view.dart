/*
File : Home Screen
Description : The main screen of the app which shows news
*/

import 'package:flutter/material.dart';
import 'package:news_app/helpers/end_points.dart';
import 'package:news_app/views/categories_list_view.dart';
import 'package:news_app/views/news_list_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Different colors of title
              Text(
                'News',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Cloud',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      //Widget to allow both horizontal and vertical screen to scroll up while scrolling down
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          //Instead of children of column
          CategoriesListView(), //Widget to show horizontal categories of news
          NewsListBuilder(category: EndPoints.general,), //Widget to show vertical list of news
        ],
      ),
    );
  }
}
