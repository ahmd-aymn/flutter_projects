import 'package:dartz/dartz.dart';
import 'package:todo/core/network/api_helper.dart';
import '../../../../core/local/local_data.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';
import '../models/user_model.dart';

class LoginRepo {
  APIHelper apiHelper = APIHelper();
  Future<Either<String, UserModel>> login(
      {required String username, required String password}) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
          endPoint: EndPoints.login,
          data: {"username": username, "password": password},
          isAuthorized: false);

      if (apiResponse.status) {
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(apiResponse.data);
        if (loginResponseModel.user == null) {
          return Left(apiResponse.message);
        }
        LocalData.accessToken = loginResponseModel.accessToken;
        LocalData.refreshToken = loginResponseModel.refreshToken;
        return Right(loginResponseModel.user!);
      } else {
        return Left(apiResponse.message);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
