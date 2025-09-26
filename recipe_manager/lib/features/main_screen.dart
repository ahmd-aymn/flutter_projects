import 'package:flutter/material.dart';
import 'package:recipe_manager/features/category_view.dart';
import 'package:recipe_manager/features/default_container.dart';
import 'package:recipe_manager/features/pop_up_screen.dart';
import 'lists.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController searchController = TextEditingController();

  void filterRecipes({required String input})
  {
    setState(() {
      filteredProducts = allRecipes.where((element) => element.title.toLowerCase().startsWith(input)).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFF8DC),
      appBar: AppBar(
        backgroundColor: Color(0XFFFFF8DC),
        title: Text("Recipe Manager", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontFamily: 'Arial')),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultContainer(controller: searchController, hint: 'Search', onChanged: (input)
                {
                  filterRecipes(input: input);
                },
                onTap: ()
                {
                  setState(() {
                    searchController.text = '';
                  });
                },
                ),
              SizedBox(height: 40),
              Column(
                    children: (filteredProducts.isNotEmpty && searchController.text != '')?
                    filteredProducts :
              [
                CategoryView(categoryTitle: "Appetizers", recipes: appetizers),
                SizedBox(height: 20),
                CategoryView(categoryTitle: "Main Courses", recipes: mainCourses),
                SizedBox(height: 20),
                CategoryView(categoryTitle: "Desserts", recipes: desserts)
              ]
             ),

            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()
          {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                      builder: (context, setState)
                      {
                        return PopUpScreen();
                      }
                  );
                }
            );
          },
          backgroundColor: Color(0XFFFFA07A),
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.transparent)),
          elevation: 5,
          child: Icon(Icons.add, color: Colors.white, size: 40),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}