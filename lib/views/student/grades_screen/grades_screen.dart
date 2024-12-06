import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:srs_fyp_2024/theme/button_style.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:srs_fyp_2024/views/student/grades_screen/grades_screen_vm.dart';
import 'package:srs_fyp_2024/views/student/grades_screen/widgets/grades_container.dart';
import 'package:srs_fyp_2024/views/student/grades_screen/widgets/grades_drawer.dart';
import 'package:stacked/stacked.dart';

class GradesBookScreen extends StatelessWidget {
  const GradesBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.initialize(),
      viewModelBuilder: () => GradesBookVM(),
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
                        const GradesDrawer(),
                        SizedBox(
                          child: SingleChildScrollView(
                            child: SizedBox(
                              width: 0.8.sw,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  20.verticalSpace,
                                  Container(
                                    width: 1.sw,
                                    margin: EdgeInsets.only(left: 0.04.sw),
                                    child: Text(
                                      'Grades',
                                      style: Style.semiBold20ptb.copyWith(
                                          color: AppColors.textColor1,
                                          fontSize: 8.sp),
                                    ),
                                  ),
                                  20.verticalSpace,
                                  Container(
                                    width: 1.sw,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 0.04.sw),
                                    child: TextField(
                                      controller: vModel.classNum,
                                      maxLines: 1,
                                      keyboardType: TextInputType.emailAddress,
                                      style: Style.regular14ptb.copyWith(
                                        fontSize: 5.sp,
                                        color: AppColors.textColor1,
                                      ),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        hintText: 'Class - XX',
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
                                    width: 1.sw,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 0.04.sw),
                                    child: TextField(
                                      controller: vModel.rollNum,
                                      maxLines: 1,
                                      keyboardType: TextInputType.emailAddress,
                                      style: Style.regular14ptb.copyWith(
                                        fontSize: 5.sp,
                                        color: AppColors.textColor1,
                                      ),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        hintText: 'Roll Num - XX',
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
                                  //course stats wala container.

                                  Container(
                                    margin: EdgeInsets.only(right: 0.04.sw),
                                    child: const GradesCard(),
                                  ),

                                  20.verticalSpace,
                                  // Container(
                                  //   margin: EdgeInsets.only(left: 0.04.sw),
                                  //   child: ElevatedButton(
                                  //     style: CustomButtonStyle.b6style,
                                  //     onPressed: () {
                                  //       // vModel.signInUser();
                                  //     },
                                  //     child: Text(
                                  //       'Download Marksheet',
                                  //       style: Style.regular14ptb
                                  //           .copyWith(fontSize: 5.sp),
                                  //     ),
                                  //   ),
                                  // ),
                                  // 20.verticalSpace,

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
