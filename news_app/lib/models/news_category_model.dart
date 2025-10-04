/*
File: Category Model
Description: model file of category contains image and label
*/
class NewsCategoryModel {
  final String label;
  final String image;
  final String endPoint;
  const NewsCategoryModel({required this.endPoint, required this.label, required this.image});
}
