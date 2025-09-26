import 'package:dartz/dartz.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';
import '../models/get_task_model.dart';

class GetTasksRepo {
  GetTasksRepo._internal();
  static final GetTasksRepo _instance = GetTasksRepo._internal();
  factory GetTasksRepo() => _instance;
  APIHelper apiHelper = APIHelper();

  Future<Either<String, List<TaskModel>>> getTasks() async {
    try {
      ApiResponse apiResponse = await apiHelper.getRequest(
          endPoint: EndPoints.my_tasks, isAuthorized: true);

      if (apiResponse.status) {
        GetTasksResponseModel getTasksResponseModel =
            GetTasksResponseModel.fromJson(apiResponse.data);
        return Right(getTasksResponseModel.tasks!);
      } else {
        return Left(apiResponse.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}
