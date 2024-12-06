// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/views/admin/admin_home_screen/admin_home_vm.dart';
import 'package:srs_fyp_2024/views/admin/admin_home_screen/widgets/add_fees.dart';
import 'package:srs_fyp_2024/views/admin/admin_home_screen/widgets/add_grades.dart';
import 'package:srs_fyp_2024/views/admin/admin_home_screen/widgets/add_salary.dart';
import 'package:srs_fyp_2024/views/admin/admin_home_screen/widgets/admin_home_drawer.dart';
import 'package:srs_fyp_2024/views/admin/admin_home_screen/widgets/upload_marksheet.dart';
import 'package:stacked/stacked.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AdminHomeVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SizedBox(
              width: 1.sw,
              child: Row(
                children: [
                  const AHomeDrawer(),
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
                                'Hey Admin,',
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
                            const AddSalary(),
                            40.verticalSpace,
                            const AddFees(),
                            40.verticalSpace,
                            const AddGrades(),
                            40.verticalSpace,
                            const UploadTTCard(),
                            20.verticalSpace,
                            //Info Section
                            // const TStatsCard(),
                            // 40.verticalSpace,
                            // // // Course Section

                            // TAssignmentCard(),
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
