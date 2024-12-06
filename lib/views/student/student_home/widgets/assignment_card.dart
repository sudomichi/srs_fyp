import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/theme/button_style.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:srs_fyp_2024/views/student/student_home/student_home_vm.dart';
import 'package:stacked/stacked.dart';

class AssignmentCard extends StatelessWidget {
  const AssignmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.initialize(),
      viewModelBuilder: () => StudentHomeVM(),
      builder: (context, vModel, child) {
        return Container(
          width: 0.7.sw,
          margin: EdgeInsets.only(left: 0.04.sw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload Assignment',
                style: Style.semiBold20ptb
                    .copyWith(color: AppColors.textColor1, fontSize: 8.sp),
              ),
              30.verticalSpace,
              Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: vModel.dropdownCourse(),
              ),
              20.verticalSpace,
              Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: vModel.dropdownAssignment(),
              ),
              20.verticalSpace,
              if (vModel.selectedAssignment == null ||
                  vModel.selectedCourse == null)
                Text(
                  'First, select Course and Assignment Number',
                  style: Style.regular16ptb
                      .copyWith(fontSize: 5.sp, color: AppColors.textColor1),
                ),
              vModel.selectedAssignment != null && vModel.selectedCourse != null
                  ? ElevatedButton(
                      // style: ElevatedButton.styleFrom(
                      //   backgroundColor: AppColors.buttonColor,
                      //   fixedSize: const Size(260, 50),
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      // ),
                      style: CustomButtonStyle.b4style,
                      onPressed: () {
                        vModel.getAssignment(
                            vModel.selectedCourse, vModel.selectedAssignment);
                      },
                      child: vModel.isBusy
                          ? const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                color: AppColors.textColor2,
                              ),
                            )
                          : Text(
                              'Search',
                              style:
                                  Style.regular14ptb.copyWith(fontSize: 4.sp),
                            ),
                    )
                  : Container(),
              if (vModel.noDocument == true && vModel.alreadyUploaded == false)
                20.verticalSpace,
              if (vModel.noDocument == true && vModel.alreadyUploaded == false)
                Text(
                  'No Assignment Available',
                  style: Style.regular14ptb
                      .copyWith(fontSize: 5.sp, color: AppColors.textColor1),
                ),
              if (vModel.alreadyUploaded == true && vModel.noDocument == false)
                20.verticalSpace,
              if (vModel.alreadyUploaded == true && vModel.noDocument == false)
                Text(
                  'You have already submitted the assignment.',
                  style: Style.regular14ptb
                      .copyWith(fontSize: 5.sp, color: AppColors.textColor1),
                ),
              if (vModel.noDocument == false) 20.verticalSpace,
              if (vModel.noDocument == false)
                Row(
                  children: [
                    ElevatedButton(
                      style: CustomButtonStyle.b4style,
                      onPressed: () {
                        vModel.openFile();
                      },
                      child: vModel.isBusy
                          ? const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                color: AppColors.textColor2,
                              ),
                            )
                          : Text(
                              'Open Assignment',
                              style:
                                  Style.regular14ptb.copyWith(fontSize: 4.sp),
                            ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: CustomButtonStyle.b4style,
                      onPressed: () {
                        vModel.pickFile();
                      },
                      child: vModel.isBusy
                          ? const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                color: AppColors.textColor2,
                              ),
                            )
                          : Text(
                              'Upload Assignment',
                              style:
                                  Style.regular14ptb.copyWith(fontSize: 4.sp),
                            ),
                    ),
                  ],
                ),
              if (vModel.isUploaded == true) 20.verticalSpace,
              if (vModel.isUploaded == true)
                Container(
                  child: Row(
                    children: [
                      TextButton(
                        // style: CustomButtonStyle.b4style,
                        onPressed: () {
                          vModel.openUploadedAssignment();
                        },
                        child: vModel.isBusy
                            ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(
                                  color: AppColors.textColor2,
                                ),
                              )
                            : Text(
                                "Assignment: ${vModel.pdfName!}",
                                style: Style.regular14ptb.copyWith(
                                    fontSize: 5.sp,
                                    color: AppColors.buttonColor,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primaryColor),
                              ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        style: CustomButtonStyle.b4style,
                        onPressed: () {
                          vModel.addAssSolToDB(vModel.selectedCourse,
                              vModel.selectedAssignment, vModel.isPdfUploaded);
                        },
                        child: vModel.isBusy
                            ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(
                                  color: AppColors.textColor2,
                                ),
                              )
                            : Text(
                                'Submit',
                                style:
                                    Style.regular14ptb.copyWith(fontSize: 4.sp),
                              ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
