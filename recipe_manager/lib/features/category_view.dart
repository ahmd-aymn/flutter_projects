import 'package:flutter/material.dart';
import 'package:recipe_manager/features/recipe_details_view.dart';

class CategoryView extends StatefulWidget {
  final String categoryTitle;
  final List<RecipeDetailsView> recipes;
  const CategoryView({super.key, required this.categoryTitle, required this.recipes});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  bool showRecipes = false;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.categoryTitle, style: TextStyle(color: Colors.black, fontFamily: 'Arial', fontSize: 18, fontWeight: FontWeight.w500)),
          ElevatedButton(
              onPressed: ()
              {
                setState(() {
                  showRecipes = !showRecipes;
                });
              },
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), backgroundColor: Color(0XFFFFA07A)),
              child: Text("${showRecipes? "Hide" : "View"} ${widget.categoryTitle}", style: TextStyle(color: Colors.white))),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.topRight,
            child: AnimatedCrossFade(duration: const Duration(milliseconds: 300),
              alignment: Alignment.topRight,
              crossFadeState: showRecipes? CrossFadeState.showSecond: CrossFadeState.showFirst,
              firstChild: SizedBox(),
              secondChild: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.recipes
                ),
              ),
            ),
          ),
        ]
    );
  }
}

