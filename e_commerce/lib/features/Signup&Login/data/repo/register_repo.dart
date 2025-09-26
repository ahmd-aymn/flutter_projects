import 'package:dartz/dartz.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';

class RegisterRepo {
  RegisterRepo._internal();
  static final RegisterRepo _instance = RegisterRepo._internal();
  factory RegisterRepo() => _instance;
  APIHelper apiHelper = APIHelper();
  Future<Either<String, String>> register(
      {required String name,
      required String password,
      required String confirmPassword,
      required String email,
      required String phone}) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
          endPoint: EndPoints.register,
          data: {
            "name": name,
            "email": email,
            "phone": phone,
            "password": password
          },
          isAuthorized: false);

      if (password != confirmPassword) {
        return left("Passwords doesn't match");
      }
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
