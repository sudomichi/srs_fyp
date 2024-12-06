import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/app/app.router.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:srs_fyp_2024/views/admin/admin_home_screen/admin_home_vm.dart';
import 'package:stacked/stacked.dart';

class AHomeDrawer extends StatelessWidget {
  const AHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => AdminHomeVM(),
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
                      // vModel.navigationService.navigateToStudentHomeScreen();
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
                    onTap: () {
                      vModel.navigationService.navigateToFeesChallanView();
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.receipt,
                          color: AppColors.textColor1,
                        ),
                        2.horizontalSpace,
                        Text(
                          'Fee Challans',
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
                      vModel.navigationService.navigateToAFeedbackScreen();
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.feedback,
                          color: AppColors.textColor1,
                        ),
                        2.horizontalSpace,
                        Text(
                          'Feedbacks',
                          style: Style.regular14ptb.copyWith(
                              fontSize: 6.sp, color: AppColors.textColor1),
                        ),
                      ],
                    ),
                  ),
                ),
                20.verticalSpace,
                // Container(
                //   margin: EdgeInsets.only(left: 0.02.sw),
                //   child: GestureDetector(
                //     onTap: () {},
                //     child: Row(
                //       children: [
                //         const Icon(
                //           Icons.picture_as_pdf,
                //           color: AppColors.textColor1,
                //         ),
                //         2.horizontalSpace,
                //         Text(
                //           'Assignments',
                //           style: Style.regular14ptb.copyWith(
                //               fontSize: 6.sp, color: AppColors.textColor1),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                const Spacer(),
                // Container(
                //   margin: EdgeInsets.only(left: 0.02.sw),
                //   child: GestureDetector(
                //     onTap: () {},
                //     child: Row(
                //       children: [
                //         const Icon(
                //           Icons.contact_support,
                //           color: AppColors.textColor1,
                //         ),
                //         2.horizontalSpace,
                //         Text(
                //           'Contact Us',
                //           style: Style.regular14ptb.copyWith(
                //               fontSize: 6.sp, color: AppColors.textColor1),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // 20.verticalSpace,
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
