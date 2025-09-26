import 'package:flutter/material.dart';

class FilteredRecipeView extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  const FilteredRecipeView({super.key, required this.title, required this.description, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: Text(title, style: TextStyle(color: Color(0XFFD2691E), fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Arial'))),
            Text(category, style: TextStyle(color: Colors.black, fontFamily: 'Arial', fontSize: 12))
          ],
        ),
        Text(description, style: TextStyle(color: Colors.black, fontSize: 10, fontFamily: 'Arial')),
        SizedBox(height: 10)
      ],
    );
  }
}
