import 'package:dartz/dartz.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';

class UpdateProfileRepo {
  UpdateProfileRepo._internal();
  static final UpdateProfileRepo _instance = UpdateProfileRepo._internal();
  factory UpdateProfileRepo() => _instance;
  APIHelper apiHelper = APIHelper();
  Future<Either<String, String>> update({required String username}) async {
    try {
      ApiResponse apiResponse = await apiHelper.putRequest(
          endPoint: EndPoints.update_profile,
          data: {"username": username},
          isAuthorized: true);

      if (apiResponse.status) {
        return Right(apiResponse.message);
      } else {
        return Left(apiResponse.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}
