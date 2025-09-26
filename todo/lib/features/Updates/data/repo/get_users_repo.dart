import 'package:dartz/dartz.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';
import '../models/get_user_model.dart';

class GetUsersRepo {
  GetUsersRepo._internal();
  static final GetUsersRepo _instance = GetUsersRepo._internal();
  factory GetUsersRepo() => _instance;
  APIHelper apiHelper = APIHelper();
  Future<Either<String, UserInfo>> getUser() async {
    try {
      ApiResponse apiResponse = await apiHelper.getRequest(
          endPoint: EndPoints.get_user_data, isAuthorized: true);

      if (apiResponse.status) {
        GetUserModel getUserModel = GetUserModel.fromJson(apiResponse.data);
        if (getUserModel.user == null) {
          return Left(apiResponse.message);
        }
        return Right(getUserModel.user!);
      } else {
        return Left(apiResponse.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}
