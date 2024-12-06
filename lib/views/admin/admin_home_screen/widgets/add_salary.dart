import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/theme/button_style.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:srs_fyp_2024/views/admin/admin_home_screen/admin_home_vm.dart';
import 'package:stacked/stacked.dart';

class AddSalary extends StatelessWidget {
  const AddSalary({super.key});

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
                    'Add Salary',
                    style: Style.semiBold20ptb
                        .copyWith(color: AppColors.textColor1, fontSize: 8.sp),
                  ),
                ),
                20.verticalSpace,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.04.sw),
                  child: TextField(
                    controller: vModel.resNoController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    style: Style.regular14ptb.copyWith(
                      fontSize: 5.sp,
                      color: AppColors.textColor1,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Registration Number',
                      hintStyle: Style.regular14ptb.copyWith(
                          color: AppColors.textColor1, fontSize: 5.sp),
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
                20.verticalSpace,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.04.sw),
                  child: TextField(
                    controller: vModel.monthController,
                    maxLines: 1,
                    style: Style.regular14ptb.copyWith(
                      fontSize: 5.sp,
                      color: AppColors.textColor1,
                    ),
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Month',
                      hintStyle: Style.regular14ptb.copyWith(
                          color: AppColors.textColor1, fontSize: 5.sp),
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
                20.verticalSpace,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.04.sw),
                  child: TextField(
                    controller: vModel.salaryController,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    style: Style.regular14ptb.copyWith(
                      fontSize: 5.sp,
                      color: AppColors.textColor1,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Salary',
                      hintStyle: Style.regular14ptb.copyWith(
                          color: AppColors.textColor1, fontSize: 5.sp),
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
                20.verticalSpace,
                Container(
                  margin: EdgeInsets.only(left: 0.04.sw),
                  child: ElevatedButton(
                    style: CustomButtonStyle.b5style,
                    onPressed: () {
                      if (vModel.resNoController != '' &&
                          vModel.salaryController != '') {
                        vModel.addSalaryToDB(vModel.resNoController.text);
                        vModel.resNoController.clear();
                        vModel.salaryController.clear();
                        vModel.snackBarService.showSnackbar(
                            message: 'Salary Added',
                            duration: Duration(seconds: 2));
                      }
                    },
                    child: Text(
                      'Add',
                      style: Style.regular14ptb.copyWith(fontSize: 4.sp),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
