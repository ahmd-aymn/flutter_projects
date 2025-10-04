/*
File: category view
Description: view file to view the category of news
*/

import 'package:flutter/material.dart';
import 'package:news_app/helpers/my_navigator.dart';
import 'package:news_app/models/news_category_model.dart';
import 'package:news_app/views/category_news_view.dart';

class CategoryCard extends StatelessWidget {
  final NewsCategoryModel newsCategoryModel; //Take the model attributes to view here
  const CategoryCard({super.key, required this.newsCategoryModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      //Row has container of the category and sized box to separate between categories
      children: [
        GestureDetector(
          onTap: () {
            myNavigator(
              context,
              screen: CategoryNewsView(category: newsCategoryModel.endPoint, title: newsCategoryModel.label,),
            );
          },
          child: Container(
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: AssetImage(newsCategoryModel.image),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: Text(
                newsCategoryModel.label,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}
