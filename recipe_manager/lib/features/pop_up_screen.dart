import 'package:flutter/material.dart';
import 'package:recipe_manager/features/added_recipe_pop.dart';
import 'package:recipe_manager/features/filtered_recipe_view.dart';
import 'package:recipe_manager/features/lists.dart';
import 'package:recipe_manager/features/recipe_details_view.dart';
import 'default_container.dart';

class PopUpScreen extends StatefulWidget {
  const PopUpScreen({super.key});

  @override
  State<PopUpScreen> createState() => _PopUpScreenState();
}

class _PopUpScreenState extends State<PopUpScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0XFFFFF8DC),
      title: Text('Add Recipe'),
      content: SizedBox(height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton
              (
              underline: Container(),
              iconSize: 30,
              value: selectedValue,

              hint: Text("Category", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),),
              items:
              [
                DropdownMenuItem(value: 'Appetizers', child: Text("Appetizers", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))),
                DropdownMenuItem(value: 'Main Courses', child: Text("Main Courses", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))),
                DropdownMenuItem(value: 'Desserts', child: Text("Desserts", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
              icon: Icon(Icons.arrow_drop_down),
            ),
            SizedBox(height: 10),
            DefaultContainer(controller: titleController, height: 50, hint: 'Title'),
            SizedBox(height: 20),
            DefaultContainer(controller: descriptionController, height: 50, hint: 'Description'),
          ],
        ),
      ),
      actions: [
        Row(
          children: [
            TextButton(
              child: Text('Add', style: TextStyle(color: Color(0XFFD2691E), fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Arial')),
              onPressed: () {
                RecipeDetailsView newRecipe = RecipeDetailsView(title: titleController.text, description: descriptionController.text);
                FilteredRecipeView newFilterRecipe = FilteredRecipeView(title: titleController.text, description: descriptionController.text, category: selectedValue!);
                if (selectedValue == 'Appetizers')
                  {
                    appetizers.add(newRecipe);
                    allRecipes.add(newFilterRecipe);
                  }
                else if (selectedValue == 'Main Courses')
                {
                  mainCourses.add(newRecipe);
                  allRecipes.add(newFilterRecipe);
                }
                else if (selectedValue == 'Desserts')
                {
                  desserts.add(newRecipe);
                  allRecipes.add(newFilterRecipe);
                }
                Navigator.pop(context);
                showDialog(
                  context: context,
                  useRootNavigator: true,
                  builder: (context) => const AddedRecipePop(),
                );

              },
            ),
            SizedBox(width: 100),
            Expanded(
              child: TextButton(
                child: Text('Close', style: TextStyle(color: Color(0XFFD2691E), fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Arial')),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
