import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/theme/button_style.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:srs_fyp_2024/views/admin/admin_home_screen/admin_home_vm.dart';
import 'package:stacked/stacked.dart';

class AddGrades extends StatelessWidget {
  const AddGrades({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.initialize(),
      viewModelBuilder: () => AdminHomeVM(),
      builder: (context, vModel, child) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 0.04.sw),
                child: Text(
                  'Add Grades',
                  style: Style.semiBold20ptb
                      .copyWith(color: AppColors.textColor1, fontSize: 8.sp),
                ),
              ),
              20.verticalSpace,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0.04.sw),
                child: TextField(
                  controller: vModel.rollNumController,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  style: Style.regular14ptb.copyWith(
                    fontSize: 5.sp,
                    color: AppColors.textColor1,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Roll Number',
                    hintStyle: Style.regular14ptb
                        .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
                    fillColor: AppColors.secondaryColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              // 20.verticalSpace,
              Form(
                key: vModel.formkey,
                child: Column(
                  children: [
                    ...vModel.displayTextfield
                        .map(
                          (e) => Container(
                            margin: EdgeInsets.only(
                                left: 0.04.sw, right: 0.04.sw, top: 0.02.sh),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, right: 20),
                                  child: Text(
                                    e['label'],
                                    style: Style.regular14ptb.copyWith(
                                        fontSize: 5.sp,
                                        color: AppColors.textColor1),
                                  ),
                                ),
                                20.horizontalSpace,
                                Expanded(child: e["course_textfield"]),
                                20.horizontalSpace,
                                Expanded(child: e["grade_textfield"]),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
              // if (vModel.displayTextfield.isNotEmpty) 20.verticalSpace,
              20.verticalSpace,
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 0.04.sw),
                    child: ElevatedButton(
                      style: CustomButtonStyle.b5style,
                      onPressed: () {
                        // vModel.signInUser();
                        vModel.addCourse();
                      },
                      child: Text(
                        'Add Course',
                        style: Style.regular14ptb.copyWith(fontSize: 4.sp),
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Container(
                    margin: EdgeInsets.only(left: 0.04.sw),
                    child: ElevatedButton(
                      style: CustomButtonStyle.b5style,
                      onPressed: () {
                        // vModel.signInUser();
                        vModel.removeCourse();
                      },
                      child: Text(
                        'Remove Course',
                        style: Style.regular14ptb.copyWith(fontSize: 4.sp),
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Container(
                    margin: EdgeInsets.only(left: 0.04.sw),
                    child: ElevatedButton(
                      style: CustomButtonStyle.b5style,
                      onPressed: () {
                        if (vModel.formkey.currentState!.validate()) {
                          vModel.addGradesToDB(vModel.rollNumController.text);
                          vModel.clearGrades();
                          vModel.snackBarService.showSnackbar(
                              message: 'Grades Added',
                              duration: Duration(seconds: 2));
                        }
                      },
                      child: Text(
                        'Add Grades',
                        style: Style.regular14ptb.copyWith(fontSize: 4.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
