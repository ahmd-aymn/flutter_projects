import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/Signup&Login/data/models/user_response_model.dart';
import '../../../../core/local/local_data.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';

class LoginRepo {
  APIHelper apiHelper = APIHelper();
  Future<Either<String, UserModel>> login(
      {required String email, required String password}) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
          endPoint: EndPoints.login,
          data: {"email": email, "password": password},
          isAuthorized: false);

      if (apiResponse.status) {
        UserResponseModel userResponseModel =
            UserResponseModel.fromJson(apiResponse.data);
        if (userResponseModel.user == null) {
          return Left(apiResponse.message);
        }
        LocalData.accessToken = userResponseModel.accessToken;
        LocalData.refreshToken = userResponseModel.refreshToken;
        return Right(userResponseModel.user!);
      } else {
        return Left(apiResponse.message);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
