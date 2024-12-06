// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/views/admin/feedback/feedback_vm.dart';
import 'package:srs_fyp_2024/views/admin/feedback/widgets/feedback_container.dart';
import 'package:srs_fyp_2024/views/admin/feedback/widgets/feedback_drawer_admin.dart';

import 'package:stacked/stacked.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';

class AFeedbackScreen extends StatelessWidget {
  const AFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      // onViewModelReady: (viewModel) => viewModel.initialize(),
      viewModelBuilder: () => AFeedbackVM(),
      builder: (context, vModel, child) {
        return StreamBuilder<QuerySnapshot>(
            stream: vModel.feedback.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      'Something went wrong',
                      style: Style.semiBold20ptb,
                    ),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
                );
              }

              return Scaffold(
                resizeToAvoidBottomInset: false,
                body: SafeArea(
                  child: SizedBox(
                    width: 1.sw,
                    child: Row(
                      children: [
                        const AFeedBackDrawer(),
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
                                      'Feedbacks',
                                      style: Style.semiBold20ptb.copyWith(
                                          color: AppColors.textColor1,
                                          fontSize: 8.sp),
                                    ),
                                  ),
                                  if (snapshot.data!.docs.isEmpty)
                                    Container(
                                      margin: EdgeInsets.only(left: 0.04.sw),
                                      child: Text(
                                        'No Feedbacks',
                                        style: Style.semiBold20ptb.copyWith(
                                            color: AppColors.textColor1,
                                            fontSize: 8.sp),
                                      ),
                                    ),
                                  if (snapshot.data!.docs.isNotEmpty)
                                    Container(
                                      margin: EdgeInsets.only(left: 0.04.sw),
                                      width: 0.7.sw,
                                      height: 0.5.sw,
                                      child: ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          // ignore: unused_local_variable
                                          DocumentSnapshot data =
                                              snapshot.data!.docs[index];
                                          return FeedbackCard(
                                              dataRecieved: data);
                                        },
                                      ),
                                    ),
                                  20.verticalSpace,
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
            });
      },
    );
  }
}
