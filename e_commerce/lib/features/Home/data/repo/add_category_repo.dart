import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/app_assets/app_images.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';
import '../models/add_category_response_model.dart';

class AddCategoryRepo {
  AddCategoryRepo._internal();
  static final AddCategoryRepo _instance = AddCategoryRepo._internal();
  factory AddCategoryRepo() => _instance;
  APIHelper apiHelper = APIHelper();

  Future<Either<String, String>> addCategory(
      {String? title, String? description}) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
          endPoint: EndPoints.new_category,
          data: {
            "title": title,
            "description": description,
            "image": AppImages.mexican_apetizer
          },
          isAuthorized: true);

      if (apiResponse.status) {
        AddCategoryResponseModel addCategoryResponseModel =
            AddCategoryResponseModel.fromJson(apiResponse.data);
        return Right(addCategoryResponseModel.message!);
      } else {
        return Left(apiResponse.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}
