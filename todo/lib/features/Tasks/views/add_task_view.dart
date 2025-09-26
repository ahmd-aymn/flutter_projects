import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/widgets/start_elev_button.dart';
import '../../../core/app_assets/AppColors.dart';
import '../../../core/app_assets/AppIcons.dart';
import '../../../core/app_assets/AppImages.dart';
import '../../../core/helper/my_navigator.dart';
import '../../../core/widgets/TextContainer.dart';
import '../manager/add_task/add_task_cubit.dart';
import '../manager/add_task/add_task_state.dart';
import 'home_view.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    IconButton(
                        icon: SvgPicture.asset(AppIcons.curvearrowbackward),
                        onPressed: () {
                          myNavigator(context, screen: Home());
                        }),
                    SizedBox(width: 105),
                    Text("Add Task", style: TextStyle(fontSize: 19))
                  ],
                ),
                Container(
                  width: 261,
                  height: 207,
                  margin:
                      EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                          image: AssetImage(AppImages.Palestine),
                          fit: BoxFit.cover)),
                ),
                SizedBox(height: 30),
                Builder(
                    builder: (context) => Column(
                          children: [
                            TextContainer(
                                label: "Task Name",
                                hint: "Enter task name",
                                borderColor: AppColors.green,
                                textController:
                                    AddTaskCubit.get(context).titleController),
                            SizedBox(height: 20),
                            TextContainer(
                                label: "Description",
                                hint: "Enter task description ...",
                                borderColor: AppColors.green,
                                textController: AddTaskCubit.get(context)
                                    .descriptionController),
                            SizedBox(height: 20),
                          ],
                        )),
                BlocConsumer<AddTaskCubit, AddTaskState>(
                    builder: (context, state) {
                  if (state is AddTaskLoadingState) {
                    return CircularProgressIndicator(color: AppColors.green);
                  } else {
                    return Column(children: [
                      state is AddTaskSuccessState
                          ? Column(
                              children: [
                                Text('Task added successfully'),
                                SizedBox(height: 10),
                                StartElevButton(
                                    label: "Go To Home",
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Home();
                                      }));
                                    })
                              ],
                            )
                          : state is AddTaskErrorState
                              ? Column(
                                  children: [
                                    Text(state.error),
                                    SizedBox(height: 10),
                                    StartElevButton(
                                        label: "Save",
                                        onPressed: () {
                                          AddTaskCubit.get(context).addTask();
                                        })
                                  ],
                                )
                              : Column(
                                  children: [
                                    SizedBox(height: 10),
                                    StartElevButton(
                                        label: "Save",
                                        onPressed: () {
                                          AddTaskCubit.get(context).addTask();
                                        })
                                  ],
                                )
                    ]);
                  }
                }, listener: (context, state) {
                  print(state.toString());
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
