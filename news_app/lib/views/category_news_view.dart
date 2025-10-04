/*
File: Category News View
Description: View file to view category news with specific UI
and bring news based on the chosen category.
*/

import 'package:flutter/material.dart';
import 'package:news_app/views/news_list_builder.dart';

class CategoryNewsView extends StatelessWidget {
  final String category;
  final String title;
  const CategoryNewsView({
    super.key,
    required this.category,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold),), 
            Text(' News', style: TextStyle(fontWeight: FontWeight.bold),)
            ]
          )
        ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [NewsListBuilder(category: category)],
      ),
    );
  }
}
