// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/views/teacher/teacher_home_screen/teacher_home_vm.dart';
import 'package:srs_fyp_2024/views/teacher/teacher_home_screen/widgets/teacher_home_drawer.dart';
import 'package:srs_fyp_2024/views/teacher/teacher_home_screen/widgets/teacher_stats_card.dart';
import 'package:srs_fyp_2024/views/teacher/teacher_home_screen/widgets/upload_assignment.dart';
import 'package:stacked/stacked.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.initialize(),
      viewModelBuilder: () => TeacherHomeVM(),
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
                        const THomeDrawer(),
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
                                    margin: EdgeInsets.only(left: 0.04.sw),
                                    child: Text(
                                      'Hey ${vModel.userData['name']},',
                                      style: Style.medium14ptb.copyWith(
                                          fontSize: 8.sp,
                                          color: AppColors.textColor1),
                                    ),
                                  ),
                                  10.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.only(left: 0.04.sw),
                                    child: Text(
                                      'Welcome to Student Automation System',
                                      style: Style.medium14ptb.copyWith(
                                          fontSize: 8.sp,
                                          color: AppColors.textColor1),
                                    ),
                                  ),
                                  40.verticalSpace,
                                  //Info Section
                                  const TStatsCard(),
                                  40.verticalSpace,
                                  // // Course Section

                                  const TAssignmentCard(),
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
