// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/theme/button_style.dart';
import 'package:srs_fyp_2024/views/student/feedback_screen/feedback_vm.dart';
import 'package:srs_fyp_2024/views/student/feedback_screen/widgets/feedback_drawer.dart';

import 'package:stacked/stacked.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.initialize(),
      viewModelBuilder: () => FeedbackVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SizedBox(
              width: 1.sw,
              child: Row(
                children: [
                  const FeedbackDrawer(),
                  SizedBox(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: 0.8.sw,
                        // height: 1.sh,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            20.verticalSpace,
                            Container(
                              margin: EdgeInsets.only(left: 0.04.sw),
                              child: Text(
                                'Feedback',
                                style: Style.semiBold20ptb.copyWith(
                                    color: AppColors.textColor1,
                                    fontSize: 8.sp),
                              ),
                            ),
                            20.verticalSpace,
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 0.04.sw),
                              child: TextField(
                                controller: vModel.teacherController,
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                style: Style.regular14ptb.copyWith(
                                  fontSize: 5.sp,
                                  color: AppColors.textColor1,
                                ),
                                // readOnly: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: 'Teacher Name',
                                  hintStyle: Style.regular14ptb.copyWith(
                                      color: AppColors.textColor1,
                                      fontSize: 5.sp),
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
                                controller: vModel.rollnumController,
                                maxLines: 1,
                                // keyboardType: TextInputType.emailAddress,
                                style: Style.regular14ptb.copyWith(
                                  fontSize: 5.sp,
                                  color: AppColors.textColor1,
                                ),
                                readOnly: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: 'Roll No - XX',
                                  hintStyle: Style.regular14ptb.copyWith(
                                      color: AppColors.textColor1,
                                      fontSize: 5.sp),
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
                                controller: vModel.emailController,
                                maxLines: 1,
                                keyboardType: TextInputType.emailAddress,
                                style: Style.regular14ptb.copyWith(
                                  fontSize: 5.sp,
                                  color: AppColors.textColor1,
                                ),
                                readOnly: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: 'Email',
                                  hintStyle: Style.regular14ptb.copyWith(
                                      color: AppColors.textColor1,
                                      fontSize: 5.sp),
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
                                controller: vModel.feedbackController,
                                maxLines: 6,
                                keyboardType: TextInputType.emailAddress,
                                style: Style.regular14ptb.copyWith(
                                  fontSize: 5.sp,
                                  color: AppColors.textColor1,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: 'Feedback',
                                  hintStyle: Style.regular14ptb.copyWith(
                                      color: AppColors.textColor1,
                                      fontSize: 5.sp),
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
                                  if (vModel.emailController.text != '' &&
                                      vModel.teacherController.text != '' &&
                                      vModel.rollnumController.text != '' &&
                                      vModel.feedbackController.text != '') {
                                    vModel.addFeedbackToDB();
                                    vModel.clear();
                                    vModel.snackBarService.showSnackbar(
                                        message: 'Feedback sent',
                                        duration: Duration(seconds: 2));
                                  }
                                },
                                child: Text(
                                  'Submit',
                                  style: Style.regular14ptb
                                      .copyWith(fontSize: 6.sp),
                                ),
                              ),
                            ),
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
