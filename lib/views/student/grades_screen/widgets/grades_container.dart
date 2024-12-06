import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:srs_fyp_2024/views/student/grades_screen/grades_screen_vm.dart';
import 'package:stacked/stacked.dart';

class GradesCard extends StatelessWidget {
  const GradesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => GradesBookVM(),
      builder: (context, vModel, child) {
        return FutureBuilder<DocumentSnapshot>(
            future: vModel.grade.doc(vModel.studentUser.rollNum).get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      'Something went wrong',
                      style: Style.regular14ptb.copyWith(
                          color: AppColors.textColor1, fontSize: 6.sp),
                    ),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data!.data() != null) {
                  Map<String, dynamic> data = {};
                  List grades = [];
                  List course = [];
                  int total_grades = 0;
                  double percentage = 0;
                  data = snapshot.data!.data() as Map<String, dynamic>;
                  for (int i = 0; i < data['grades'].length; i++) {
                    grades.add(data['grades'][i]['grade']);
                    course.add(data['grades'][i]['course_name']);
                  }
                  for (int i = 0; i < grades.length; i++) {
                    total_grades = total_grades + int.parse(grades[i]);
                  }
                  percentage = total_grades / (100 * grades.length) * 100;
                  print(data);
                  print(grades);
                  print(course);

                  return Container(
                    margin: EdgeInsets.only(left: 0.04.sw),
                    child: Column(
                      children: [
                        Container(
                          width: 0.72.sw,
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
                              'My Course',
                              style:
                                  Style.semiBold14ptb.copyWith(fontSize: 10.sp),
                            ),
                          ),
                        ),
                        // if (vModel.grades.isNotEmpty)
                        Container(
                          width: 0.72.sw,
                          // height: 0.75.sh,
                          decoration: const BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: 0.02.sh),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0; i < grades.length; i++)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // margin:
                                        //     EdgeInsets.symmetric(horizontal: 0.05.sw),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 0.1.sw,
                                              child: Text(
                                                course[i],
                                                style:
                                                    Style.medium20ptb.copyWith(
                                                  fontSize: 6.sp,
                                                  color: AppColors.textColor1,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            30.horizontalSpace,
                                            Text(
                                              "---------------------------",
                                              style: Style.medium20ptb.copyWith(
                                                  fontSize: 6.sp,
                                                  color: AppColors.textColor1),
                                              textAlign: TextAlign.center,
                                            ),
                                            30.horizontalSpace,
                                            SizedBox(
                                              width: 0.03.sw,
                                              child: Text(
                                                grades[i],
                                                style: Style.medium20ptb
                                                    .copyWith(
                                                        fontSize: 6.sp,
                                                        color: AppColors
                                                            .textColor1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      15.verticalSpace,
                                      const Divider(
                                        color: AppColors.textColor1,
                                        height: 2,
                                        thickness: 1,
                                        indent: 20,
                                        endIndent: 20,
                                      ),
                                      15.verticalSpace,
                                    ],
                                  ),
                                Container(
                                  margin: EdgeInsets.only(right: 0.04.sw),
                                  child: Text(
                                    'Percentage - $percentage%',
                                    style: Style.medium20ptb.copyWith(
                                      fontSize: 6.sp,
                                      color: AppColors.textColor1,
                                    ),
                                  ),
                                ),
                                10.verticalSpace,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.only(left: 0.04.sw),
                    child: Column(
                      children: [
                        Container(
                          width: 0.72.sw,
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
                              'My Course',
                              style:
                                  Style.semiBold14ptb.copyWith(fontSize: 10.sp),
                            ),
                          ),
                        ),
                        // if (vModel.grades.isNotEmpty)
                        Container(
                          width: 0.72.sw,
                          // height: 0.75.sh,
                          decoration: const BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Container(
                            margin:
                                EdgeInsets.only(top: 0.02.sh, bottom: 0.02.sh),
                            child: Text(
                              'Grades not added at the moment.',
                              style: Style.regular14ptb.copyWith(
                                fontSize: 5.sp,
                                color: AppColors.textColor1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }

              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.buttonColor,
                  ),
                ),
              );
            });
      },
    );
  }
}
