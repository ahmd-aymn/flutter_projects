/*
File : Categories File
Description: view file to view horizontal list of categories of news
*/

import 'package:flutter/material.dart';
import 'package:news_app/helpers/end_points.dart';
import 'package:news_app/models/news_category_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  //List of categories models which contain image and label
  final List<NewsCategoryModel> newsCategories = const [
    NewsCategoryModel(image: 'assets/business.jpeg', label: 'Business', endPoint: EndPoints.business),
    NewsCategoryModel(image: 'assets/entertaiment.png', label: 'Entertainment', endPoint: EndPoints.entertainment),
    NewsCategoryModel(image: 'assets/general.jpeg', label: 'General', endPoint: EndPoints.general),
    NewsCategoryModel(image: 'assets/health.png', label: 'Health', endPoint: EndPoints.health),
    NewsCategoryModel(image: 'assets/science.png', label: 'Science', endPoint: EndPoints.science),
    NewsCategoryModel(image: 'assets/sports.jpeg', label: 'Sports', endPoint: EndPoints.sports),
    NewsCategoryModel(image: 'assets/technology.jpeg', label: 'Technology', endPoint: EndPoints.technology),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 150,
        child: ListView(
          padding: EdgeInsets.only(
            left: 16,
            top: 32,
            bottom: 32,
          ), //Padding is not for right because there is sized box in the right of each category
          scrollDirection: Axis.horizontal,
          //Method to convert the list from category model to category view
          children: newsCategories
              .map((category) => CategoryCard(newsCategoryModel: category))
              .toList(),
        ),
      ),
    );
  }
}
