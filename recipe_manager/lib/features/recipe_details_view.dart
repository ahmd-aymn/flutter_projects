import 'package:flutter/material.dart';

class RecipeDetailsView extends StatelessWidget {
  final String title;
  final String description;
  const RecipeDetailsView({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Color(0XFFD2691E), fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Arial')),
        Text(description, style: TextStyle(color: Colors.black, fontSize: 10, fontFamily: 'Arial')),
        SizedBox(height: 10)
      ],
    );
  }
}
