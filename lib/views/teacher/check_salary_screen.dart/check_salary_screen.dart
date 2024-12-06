// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/views/teacher/check_salary_screen.dart/check_salary_vm.dart';
import 'package:srs_fyp_2024/views/teacher/check_salary_screen.dart/widgets/salary_drawer.dart';

import 'package:stacked/stacked.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';

class CheckSalaryScreen extends StatelessWidget {
  const CheckSalaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.initialize(),
      viewModelBuilder: () => CheckSalaryVM(),
      builder: (context, vModel, child) {
        return vModel.isBusy
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.buttonColor,
                  ),
                ),
              )
            : Scaffold(
                resizeToAvoidBottomInset: false,
                body: SafeArea(
                  child: SizedBox(
                    width: 1.sw,
                    child: Row(
                      children: [
                        const SalaryDrawer(),
                        SizedBox(
                          child: SingleChildScrollView(
                            child: SizedBox(
                              width: 0.8.sw,
                              height: 1.sh,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  20.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.only(left: 0.04.sw),
                                    child: Text(
                                      'Check Salary',
                                      style: Style.semiBold20ptb.copyWith(
                                          color: AppColors.textColor1,
                                          fontSize: 8.sp),
                                    ),
                                  ),
                                  20.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 0.04.sw),
                                    child: TextField(
                                      controller: vModel.month,
                                      maxLines: 1,
                                      keyboardType: TextInputType.emailAddress,
                                      style: Style.regular14ptb.copyWith(
                                        fontSize: 5.sp,
                                        color: AppColors.textColor1,
                                      ),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        hintText: 'Current Month',
                                        hintStyle: Style.regular14ptb.copyWith(
                                            color: AppColors.textColor1,
                                            fontSize: 5.sp),
                                        fillColor: AppColors.secondaryColor,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: AppColors.secondaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 0.04.sw),
                                    child: TextField(
                                      controller: vModel.salary,
                                      maxLines: 1,
                                      keyboardType: TextInputType.emailAddress,
                                      style: Style.regular14ptb.copyWith(
                                        fontSize: 5.sp,
                                        color: AppColors.textColor1,
                                      ),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        hintText: 'Current Salary',
                                        hintStyle: Style.regular14ptb.copyWith(
                                            color: AppColors.textColor1,
                                            fontSize: 5.sp),
                                        fillColor: AppColors.secondaryColor,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: AppColors.secondaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: AppColors.primaryColor,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Center(
                                    child: Text(
                                      'lutonschool@edu.pk',
                                      style: Style.medium14ptb.copyWith(
                                        color: AppColors.textColor1,
                                        fontSize: 5.sp,
                                      ),
                                    ),
                                  ),
                                  10.verticalSpace,
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
