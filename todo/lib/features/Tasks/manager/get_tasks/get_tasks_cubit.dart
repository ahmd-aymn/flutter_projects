import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/Tasks/data/repo/get_tasks_repo.dart';
import 'get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit() : super(GetTasksState());
  static GetTasksCubit get(context) => BlocProvider.of(context);

  void getTasks() async {
    GetTasksRepo getTasksRepo = GetTasksRepo();
    var response = await getTasksRepo.getTasks();
    response.fold((error) {
      emit(GetTasksErrorState(error));
    }, (tasks) {
      emit(GetTasksSuccessState(tasks));
    });
  }
}
