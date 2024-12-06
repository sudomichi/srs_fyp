import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/theme/button_style.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:srs_fyp_2024/views/admin/admin_home_screen/admin_home_vm.dart';
import 'package:stacked/stacked.dart';

class UploadTTCard extends StatelessWidget {
  const UploadTTCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.initialize(),
      viewModelBuilder: () => AdminHomeVM(),
      builder: (context, vModel, child) {
        return Container(
          width: 0.7.sw,
          margin: EdgeInsets.only(left: 0.04.sw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 1.sw,
                child: Text(
                  'Exam Timetable',
                  style: Style.semiBold20ptb
                      .copyWith(color: AppColors.textColor1, fontSize: 8.sp),
                ),
              ),
              10.verticalSpace,
              Container(
                width: 1.sw,
                child: Text(
                  'Upload the Timetable by pressing the button below.',
                  style: Style.regular16ptb
                      .copyWith(fontSize: 6.sp, color: AppColors.textColor1),
                ),
              ),
              20.verticalSpace,
              Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: vModel.dropdownClass(),
              ),
              if (vModel.selectedClass == null) 5.verticalSpace,
              vModel.selectedClass == null
                  ? Text(
                      'First, Select the Class Number',
                      style: Style.regular16ptb.copyWith(
                          color: AppColors.textColor1, fontSize: 4.sp),
                    )
                  : Container(),
              if (vModel.selectedClass != null) 20.verticalSpace,
              vModel.selectedClass != null
                  ? ElevatedButton(
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
                          : vModel.isUploaded == false
                              ? Text(
                                  'Upload',
                                  style: Style.regular14ptb
                                      .copyWith(fontSize: 6.sp),
                                )
                              : Text(
                                  'Re-Upload',
                                  style: Style.regular14ptb
                                      .copyWith(fontSize: 6.sp),
                                ),
                    )
                  : Container(),
              if (vModel.isUploaded == true) 20.verticalSpace,
              if (vModel.isUploaded == true)
                Container(
                  child: Row(
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
                                'Open Pdf',
                                style:
                                    Style.regular14ptb.copyWith(fontSize: 6.sp),
                              ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        style: CustomButtonStyle.b4style,
                        onPressed: () {
                          vModel.addETTToDB(
                              vModel.selectedClass, vModel.isPdfUploaded);
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
                                    Style.regular14ptb.copyWith(fontSize: 6.sp),
                              ),
                      ),
                    ],
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
