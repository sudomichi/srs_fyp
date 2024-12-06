import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:srs_fyp_2024/views/student/student_home/student_home_vm.dart';
import 'package:stacked/stacked.dart';

class CoursesCard extends StatelessWidget {
  const CoursesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.initialize(),
        viewModelBuilder: () => StudentHomeVM(),
        builder: (context, vModel, child) {
          return Container(
            margin: EdgeInsets.only(left: 0.04.sw),
            child: Column(
              children: [
                Container(
                  width: 0.7.sw,
                  height: 0.15.sh,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'My Course',
                      style: Style.semiBold14ptb.copyWith(fontSize: 10.sp),
                    ),
                  ),
                ),
                Container(
                  width: 0.7.sw,
                  // height: 0.75.sh,
                  decoration: const BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 0.02.sh),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < vModel.course.length; i++)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Course - ${i + 1}',
                                      style: Style.medium20ptb.copyWith(
                                        fontSize: 6.sp,
                                        color: AppColors.textColor1,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    30.horizontalSpace,
                                    Text(
                                      "---------------------------",
                                      style: Style.medium20ptb.copyWith(
                                          fontSize: 6.sp,
                                          color: AppColors.textColor1),
                                      textAlign: TextAlign.center,
                                    ),
                                    30.horizontalSpace,
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                        vModel.course[i],
                                        style: Style.medium20ptb.copyWith(
                                            fontSize: 6.sp,
                                            color: AppColors.textColor1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              15.verticalSpace,
                              if (i != vModel.course.length - 1)
                                const Divider(
                                  color: AppColors.textColor1,
                                  height: 2,
                                  thickness: 1,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                              if (i != vModel.course.length - 1)
                                15.verticalSpace,
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
