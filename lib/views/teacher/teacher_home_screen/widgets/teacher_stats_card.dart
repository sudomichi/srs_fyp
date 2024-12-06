import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:srs_fyp_2024/views/teacher/teacher_home_screen/teacher_home_vm.dart';
import 'package:stacked/stacked.dart';

class TStatsCard extends StatelessWidget {
  const TStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.initialize(),
      viewModelBuilder: () => TeacherHomeVM(),
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
                      margin: EdgeInsets.only(top: 0.03.sh),
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
                                      'Restration No#: ${vModel.userData['resNo']}',
                                      style: Style.regular14ptb.copyWith(
                                          fontSize: 7.sp,
                                          color: AppColors.textColor1),
                                    ),
                                    5.verticalSpace,
                                    Text(
                                      'Designation: ${vModel.userData['desingation']}',
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
                    20.verticalSpace,
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
