import 'package:recipe_manager/features/recipe_details_view.dart';
import 'filtered_recipe_view.dart';

List<RecipeDetailsView> appetizers = [
  RecipeDetailsView(title: "Bruschetta", description: "Delicious toasted bread topped with tomatoes and basil."),
  RecipeDetailsView(title: "Stuffed Mushrooms", description: "Juicy mushrooms filled with a savory cheese mixture."),
  RecipeDetailsView(title: "Delived Eggs", description: "Classic appetizer with a creamy yolk filling."),
];

List<RecipeDetailsView> mainCourses = [
  RecipeDetailsView(title: "Grilled Chicken", description: "Juicy chicken marinated and grilled to perfection."),
  RecipeDetailsView(title: "Spaghetti Bolognese", description: "Classic Italian pasta dish with a rich meat sauce."),
  RecipeDetailsView(title: "Vegetable Stir Fry", description: "Colorful vegetables sautéed in a savory sauce."),
];

List<RecipeDetailsView> desserts = [
  RecipeDetailsView(title: "Chocolate Cake", description: "Rich and moist chocolate cake with creamy frosting."),
  RecipeDetailsView(title: "Apple Pie", description: "Classic dessert with a flaky crust and spiced apples."),
  RecipeDetailsView(title: "Cheesecake", description: "Creamy cheesecake with a graham cracker crust."),
];

List<FilteredRecipeView> allRecipes =
[
  FilteredRecipeView(title: "Bruschetta", description: "Delicious toasted bread topped with tomatoes and basil.", category: "Appetizers"),
  FilteredRecipeView(title: "Stuffed Mushrooms", description: "Juicy mushrooms filled with a savory cheese mixture.", category: "Appetizers"),
  FilteredRecipeView(title: "Delived Eggs", description: "Classic appetizer with a creamy yolk filling.", category: "Appetizers"),
  FilteredRecipeView(title: "Grilled Chicken", description: "Juicy chicken marinated and grilled to perfection.", category: "Main Courses"),
  FilteredRecipeView(title: "Spaghetti Bolognese", description: "Classic Italian pasta dish with a rich meat sauce.", category: "Main Courses"),
  FilteredRecipeView(title: "Vegetable Stir Fry", description: "Colorful vegetables sautéed in a savory sauce.", category: "Main Courses"),
  FilteredRecipeView(title: "Chocolate Cake", description: "Rich and moist chocolate cake with creamy frosting.", category: "Desserts"),
  FilteredRecipeView(title: "Apple Pie", description: "Classic dessert with a flaky crust and spiced apples.", category: "Desserts"),
  FilteredRecipeView(title: "Cheesecake", description: "Creamy cheesecake with a graham cracker crust.", category: "Desserts"),
];
List<FilteredRecipeView> filteredProducts = [];