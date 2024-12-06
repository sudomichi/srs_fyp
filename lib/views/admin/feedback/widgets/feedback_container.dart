import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';

class FeedbackCard extends StatelessWidget {
  final Map? data;
  final DocumentSnapshot dataRecieved;
  const FeedbackCard({super.key, this.data, required this.dataRecieved});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 3),
        borderRadius: BorderRadius.circular(20),
        color: AppColors.textColor2,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 0.02.sh),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "For:",
              style: Style.semiBold20ptb
                  .copyWith(color: AppColors.textColor1, fontSize: 6.sp),
            ),
            5.verticalSpace,
            Text(
              "${dataRecieved['teacherName']}",
              style: Style.regular16ptb
                  .copyWith(color: AppColors.textColor1, fontSize: 6.sp),
            ),
            5.verticalSpace,
            Text(
              "Roll Num:",
              style: Style.semiBold20ptb
                  .copyWith(color: AppColors.textColor1, fontSize: 6.sp),
            ),
            5.verticalSpace,
            Text(
              "${dataRecieved['rollNum']}",
              style: Style.regular16ptb
                  .copyWith(color: AppColors.textColor1, fontSize: 6.sp),
            ),
            5.verticalSpace,
            Text(
              "Email:",
              style: Style.semiBold20ptb
                  .copyWith(color: AppColors.textColor1, fontSize: 6.sp),
            ),
            5.verticalSpace,
            Text(
              "${dataRecieved['email']}",
              style: Style.regular16ptb
                  .copyWith(color: AppColors.textColor1, fontSize: 6.sp),
            ),
            5.verticalSpace,
            Text(
              "Feeback:",
              style: Style.semiBold20ptb
                  .copyWith(color: AppColors.textColor1, fontSize: 6.sp),
            ),
            5.verticalSpace,
            Text(
              "${dataRecieved['feedback']}",
              style: Style.regular16ptb
                  .copyWith(color: AppColors.textColor1, fontSize: 6.sp),
            ),
          ],
        ),
      ),
    );
  }
}
