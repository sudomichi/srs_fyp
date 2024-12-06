import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/theme/button_style.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:srs_fyp_2024/views/student/student_home/student_home_vm.dart';
import 'package:stacked/stacked.dart';

class ExamTimetableCard extends StatelessWidget {
  const ExamTimetableCard({super.key});

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
              if (vModel.noTimeTable == true)
                Container(
                  width: 1.sw,
                  child: Text(
                    'Timetable is uploaded yet.',
                    style: Style.regular16ptb
                        .copyWith(fontSize: 6.sp, color: AppColors.textColor1),
                  ),
                ),
              if (vModel.noTimeTable == false)
                Container(
                  width: 1.sw,
                  child: Text(
                    'Download the Timetable by pressing the button below.',
                    style: Style.regular16ptb
                        .copyWith(fontSize: 6.sp, color: AppColors.textColor1),
                  ),
                ),
              if (vModel.noTimeTable == false) 10.verticalSpace,
              if (vModel.noTimeTable == false)
                ElevatedButton(
                  style: CustomButtonStyle.b4style,
                  onPressed: () {
                    vModel.openTimeTable();
                  },
                  child: Text(
                    'Download',
                    style: Style.regular14ptb.copyWith(fontSize: 6.sp),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
