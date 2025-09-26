import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/features/Tasks/views/widgets/TaskCounter.dart';
import 'package:todo/features/Tasks/views/widgets/task_container.dart';
import '../../../core/app_assets/AppColors.dart';
import '../../../core/app_assets/AppIcons.dart';
import '../../../core/helper/my_navigator.dart';
import '../../../core/widgets/profile_app_bar.dart';
import '../manager/get_tasks/get_tasks_cubit.dart';
import '../manager/get_tasks/get_tasks_state.dart';
import 'add_task_view.dart';

class Home extends StatelessWidget {
  final String? title;
  final String? description;
  const Home({super.key, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => GetTasksCubit()..getTasks(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Row(
                  children: [
                    ProfileAppBar(),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: InkWell(
                              onTap: () =>
                                  myNavigator(context, screen: AddTask()),
                              child: SvgPicture.asset(AppIcons.plus))),
                    )
                  ],
                ),
                SizedBox(height: 30),
                BlocConsumer<GetTasksCubit, GetTasksState>(
                    listener: (context, state) {
                  print(state.toString());
                }, builder: (context, state) {
                  if (state is GetTasksSuccessState) {
                    return Column(
                      children: [
                        TaskCounter(label: "Tasks", number: state.tasks.length),
                        SizedBox(height: 20),
                        (state.tasks.isEmpty)
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "There are no tasks yet,\n     Press the button\n    To add New Task ")
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  SvgPicture.asset(AppIcons.notasks)
                                ],
                              )
                            : SizedBox(
                                height: (screenHeight * (3 / 4)),
                                child: ListView.separated(
                                    padding: EdgeInsets.all(20),
                                    itemBuilder: (context, index) =>
                                        TaskContainer(
                                            title: state.tasks[index].title,
                                            description:
                                                state.tasks[index].description),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(height: 20),
                                    itemCount: state.tasks.length),
                              )
                      ],
                    );
                  } else {
                    return SizedBox();
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                  width: 335,
                  height: 135,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: AppColors.green
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Your today’s tasks\nalmost done!", style: TextStyle(color: Colors.white),),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text("80", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                          Text("%", style: TextStyle(color: Colors.white, fontSize: 25),),
                          SizedBox(width: 90),
                          MyButtons(radius: 18, width: 121, height: 34, color: Colors.white, child: Center(child: Text("View Tasks", style: TextStyle(color: AppColors.green),)),)
                        ],
                      )
                    ],
                  ),
                ),*/
