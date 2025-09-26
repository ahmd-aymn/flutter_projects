import 'package:dartz/dartz.dart';
import 'package:todo/features/Tasks/data/models/add_task_model.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';

class AddTaskRepo {
  AddTaskRepo._internal();
  static final AddTaskRepo _instance = AddTaskRepo._internal();
  factory AddTaskRepo() => _instance;
  APIHelper apiHelper = APIHelper();

  Future<Either<String, String>> addTask(
      {String? title, String? description}) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
          endPoint: EndPoints.new_task,
          data: {"title": title, "description": description},
          isAuthorized: true);

      if (apiResponse.status) {
        AddTaskResponseModel addTaskResponseModel =
            AddTaskResponseModel.fromJson(apiResponse.data);
        return Right(addTaskResponseModel.message!);
      } else {
        return Left(apiResponse.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}
