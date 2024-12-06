import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:srs_fyp_2024/views/admin/view_fee_challan/fees_challan_vm.dart';
import 'package:srs_fyp_2024/views/admin/view_fee_challan/widgets/fees_challan_container.dart';
import 'package:srs_fyp_2024/views/admin/view_fee_challan/widgets/fees_challan_drawer.dart';
import 'package:stacked/stacked.dart';

class FeesChallanView extends StatelessWidget {
  const FeesChallanView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => FeesChallanVM(),
      builder: (context, vModel, child) {
        return StreamBuilder<QuerySnapshot>(
            stream: vModel.feesPaid.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      'Something went wrong',
                      style: Style.semiBold20ptb
                          .copyWith(color: AppColors.textColor1),
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

              print(snapshot.data!.docs.length.toString());
              return Scaffold(
                resizeToAvoidBottomInset: false,
                body: SafeArea(
                  child: SizedBox(
                    width: 1.sw,
                    child: Row(
                      children: [
                        const FeesCDrawer(),
                        SizedBox(
                          child: SingleChildScrollView(
                            child: SizedBox(
                              width: 0.8.sw,
                              // height: 0.5.sh,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  20.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.only(left: 0.04.sw),
                                    child: Text(
                                      'Fees Challans',
                                      style: Style.semiBold20ptb.copyWith(
                                          color: AppColors.textColor1,
                                          fontSize: 8.sp),
                                    ),
                                  ),
                                  20.verticalSpace,
                                  if (snapshot.data!.docs.isEmpty)
                                    Container(
                                      margin: EdgeInsets.only(left: 0.04.sw),
                                      child: Text(
                                        'No Fees Challan Submitted Yet',
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
                                          return FeesChallanContainer(
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
