import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/Home/data/models/get_categories_response_model.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';

class GetCategoriesRepo {
  GetCategoriesRepo._internal();
  static final GetCategoriesRepo _instance = GetCategoriesRepo._internal();
  factory GetCategoriesRepo() => _instance;
  APIHelper apiHelper = APIHelper();

  Future<Either<String, List<Categories>>> getCategories() async {
    try {
      ApiResponse apiResponse = await apiHelper.getRequest(
          endPoint: EndPoints.get_categories, isAuthorized: true);

      if (apiResponse.status) {
        GetCategoriesResponseModel getCategoriesResponseModel =
            GetCategoriesResponseModel.fromJson(apiResponse.data);
        return Right(getCategoriesResponseModel.categories!);
      } else {
        return Left(apiResponse.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}
