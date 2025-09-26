import 'package:dartz/dartz.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';

class ChangePasswordRepo {
  ChangePasswordRepo._internal();
  static final ChangePasswordRepo _instance = ChangePasswordRepo._internal();
  factory ChangePasswordRepo() => _instance;
  APIHelper apiHelper = APIHelper();
  Future<Either<String, String>> change(
      {required String currentPassword,
      required String newPassword,
      required String confirmPassword}) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
          endPoint: EndPoints.change_password,
          data: {
            "current_password": currentPassword,
            "new_password": newPassword,
            "new_password_confirm": confirmPassword
          },
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
