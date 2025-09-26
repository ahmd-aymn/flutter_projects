import 'package:e_commerce/core/app_assets/app_styles.dart';
import 'package:e_commerce/features/Home/manager/add_category/add_category_cubit.dart';
import 'package:e_commerce/features/Home/manager/add_category/add_category_state.dart';
import 'package:e_commerce/features/Signup&Login/views/widgets/default_form_field.dart';
import 'package:e_commerce/features/Signup&Login/views/widgets/message_with_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/app_assets/app_colors.dart';
import '../../../core/app_assets/app_icons.dart';
import '../../../core/app_assets/app_images.dart';
import '../../../core/helper/my_navigator.dart';
import 'home_view.dart';

class AddItemView extends StatelessWidget {
  const AddItemView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCategoryCubit(),
      child: Scaffold(
        backgroundColor: AppColors.lightOrange,
        appBar: AppBar(
          backgroundColor: AppColors.lightOrange,
          leading: IconButton(
              onPressed: () {
                myNavigator(context, screen: HomeView());
              },
              icon: SvgPicture.asset(AppIcons.arrowBackward)),
          title: Text('Add Category', style: AppStyles.titleStyle),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  width: 261,
                  height: 207,
                  margin:
                      EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                          image: AssetImage(AppImages.mexican_apetizer),
                          fit: BoxFit.cover)),
                ),
                SizedBox(height: 30),
                Builder(
                    builder: (context) => Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: DefaultFormField(
                                  controller: AddCategoryCubit.get(context)
                                      .titleController,
                                  hint: "Enter category name",
                                  hintStyle: AppStyles.hintStyle),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: DefaultFormField(
                                  controller: AddCategoryCubit.get(context)
                                      .descriptionController,
                                  hint: "Enter category description",
                                  hintStyle: AppStyles.hintStyle),
                            ),
                            SizedBox(height: 20),
                          ],
                        )),
                BlocConsumer<AddCategoryCubit, AddCategoryState>(
                    builder: (context, state) {
                  if (state is AddCategoryLoadingState) {
                    return CircularProgressIndicator(color: AppColors.orange);
                  } else {
                    return Column(children: [
                      state is AddCategorySuccessState
                          ? MessageWithButton(
                              message: state.msg,
                              onPressed: () {
                                myNavigator(context, screen: HomeView());
                              },
                              buttonLabel: 'Home',
                              messageColor: Colors.green)
                          : state is AddCategoryErrorState
                              ? MessageWithButton(
                                  message: state.error,
                                  onPressed: () {
                                    AddCategoryCubit.get(context).addCategory();
                                  },
                                  buttonLabel: 'Save',
                                  messageColor: Colors.red)
                              : MessageWithButton(
                                  message: '',
                                  onPressed: () {
                                    AddCategoryCubit.get(context).addCategory();
                                  },
                                  buttonLabel: 'Save')
                    ]);
                  }
                }, listener: (context, state) {
                  print(state.toString());
                  if (state is AddCategorySuccessState) {
                    myNavigator(context, screen: HomeView());
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
