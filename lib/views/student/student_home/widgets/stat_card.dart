import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:srs_fyp_2024/views/student/student_home/student_home_vm.dart';
import 'package:stacked/stacked.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({super.key});

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
                    'My Stats',
                    style: Style.semiBold14ptb.copyWith(fontSize: 10.sp),
                  ),
                ),
              ),
              Container(
                width: 0.7.sw,
                height: 0.75.sh,
                decoration: const BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //1st Row
                    Container(
                      margin: EdgeInsets.only(top: 0.05.sh),
                      width: 0.7.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Container(
                                    // width: 0.2.sw,
                                    // height: 0.35.sh,
                                    width: 200.h,
                                    height: 200.h,
                                    color: Colors.white,
                                    child: Image.network(
                                      vModel.studentUser.imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name: ${vModel.userData['name']}',
                                      style: Style.regular14ptb.copyWith(
                                          fontSize: 7.sp,
                                          color: AppColors.textColor1),
                                    ),
                                    5.verticalSpace,
                                    Text(
                                      'Roll Num: ${vModel.userData['rollNum']}',
                                      style: Style.regular14ptb.copyWith(
                                          fontSize: 7.sp,
                                          color: AppColors.textColor1),
                                    ),
                                    5.verticalSpace,
                                    Text(
                                      'Class: ${vModel.userData['class']}',
                                      style: Style.regular14ptb.copyWith(
                                          fontSize: 7.sp,
                                          color: AppColors.textColor1),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            child: GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    size: 20.sp,
                                  ),
                                  5.verticalSpace,
                                  Text(
                                    'Announcment',
                                    style: Style.regular14ptb.copyWith(
                                        color: AppColors.textColor1,
                                        fontSize: 7.sp),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // 2nd Row
                    30.verticalSpace,
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 0.25.sw,
                            height: 0.25.sh,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Registered Course',
                                  style: Style.medium14ptw.copyWith(
                                    fontSize: 6.sp,
                                  ),
                                ),
                                Text(
                                  '${vModel.course.length}',
                                  style: Style.medium14ptb
                                      .copyWith(fontSize: 6.sp),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 0.25.sw,
                            height: 0.25.sh,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Estimated Fees',
                                  style: Style.medium14ptw.copyWith(
                                    fontSize: 6.sp,
                                  ),
                                ),
                                Text(
                                  vModel.feesBook['Fees'] ?? 'Not Added',
                                  style: Style.medium14ptb
                                      .copyWith(fontSize: 6.sp),
                                ),
                              ],
                            ),
                          ),
                        ],
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
