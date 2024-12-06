import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/app/app.router.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:srs_fyp_2024/views/teacher/teacher_home_screen/teacher_home_vm.dart';
import 'package:stacked/stacked.dart';

class CheckAssignmentDrawer extends StatelessWidget {
  const CheckAssignmentDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.initialize(),
        viewModelBuilder: () => TeacherHomeVM(),
        builder: (context, vModel, child) {
          return Container(
            width: 0.2.sw,
            color: AppColors.drawerColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 0.1.sw,
                    child: Image.asset(
                      vModel.logo,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                20.verticalSpace,
                Container(
                  margin: EdgeInsets.only(left: 0.02.sw),
                  child: GestureDetector(
                    onTap: () {
                      vModel.navigationService.navigateToTeacherHomeScreen();
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.home,
                          color: AppColors.textColor1,
                        ),
                        2.horizontalSpace,
                        Text(
                          'Home',
                          style: Style.regular14ptb.copyWith(
                              fontSize: 6.sp, color: AppColors.textColor1),
                        ),
                      ],
                    ),
                  ),
                ),
                20.verticalSpace,
                Container(
                  margin: EdgeInsets.only(left: 0.02.sw),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.receipt_long,
                          color: AppColors.textColor1,
                        ),
                        2.horizontalSpace,
                        Text(
                          'Check Salary',
                          style: Style.regular14ptb.copyWith(
                              fontSize: 6.sp, color: AppColors.textColor1),
                        ),
                      ],
                    ),
                  ),
                ),
                20.verticalSpace,
                Container(
                  margin: EdgeInsets.only(left: 0.02.sw),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.picture_as_pdf,
                          color: AppColors.textColor1,
                        ),
                        2.horizontalSpace,
                        Text(
                          'Assignments',
                          style: Style.regular14ptb.copyWith(
                              fontSize: 6.sp, color: AppColors.textColor1),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  margin: EdgeInsets.only(left: 0.02.sw),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.contact_support,
                          color: AppColors.textColor1,
                        ),
                        2.horizontalSpace,
                        Text(
                          'Contact Us',
                          style: Style.regular14ptb.copyWith(
                              fontSize: 6.sp, color: AppColors.textColor1),
                        ),
                      ],
                    ),
                  ),
                ),
                20.verticalSpace,
                Container(
                  margin: EdgeInsets.only(left: 0.02.sw),
                  child: GestureDetector(
                    onTap: () {
                      vModel.signOut();
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.logout,
                          color: AppColors.textColor1,
                        ),
                        2.horizontalSpace,
                        Text(
                          'Sign Out',
                          style: Style.regular14ptb.copyWith(
                              fontSize: 6.sp, color: AppColors.textColor1),
                        ),
                      ],
                    ),
                  ),
                ),
                10.verticalSpace
              ],
            ),
          );
        });
  }
}
