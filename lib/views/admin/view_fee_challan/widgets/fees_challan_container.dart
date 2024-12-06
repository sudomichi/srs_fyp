import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:srs_fyp_2024/views/admin/view_fee_challan/fees_challan_vm.dart';
import 'package:stacked/stacked.dart';

class FeesChallanContainer extends StatelessWidget {
  final DocumentSnapshot dataRecieved;
  const FeesChallanContainer({super.key, required this.dataRecieved});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => FeesChallanVM(),
      builder: (context, vModel, child) {
        return Container(
          width: 0.7.sw,
          child: Row(
            children: [
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 0.04.sw),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor, width: 3),
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.textColor2,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 0.15.sw,
                        child: Text(
                          dataRecieved['name'],
                          overflow: TextOverflow.ellipsis,
                          style: Style.regular16ptb.copyWith(
                              color: AppColors.textColor1, fontSize: 4.sp),
                        ),
                      ),
                      5.horizontalSpace,
                      SizedBox(
                        // width: 0.1.sw,
                        child: Text(
                          '|',
                          style: Style.regular16ptb.copyWith(
                              color: AppColors.textColor1, fontSize: 4.sp),
                        ),
                      ),
                      5.horizontalSpace,
                      SizedBox(
                        width: 0.1.sw,
                        child: Text(
                          dataRecieved['rollNum'],
                          overflow: TextOverflow.ellipsis,
                          style: Style.regular16ptb.copyWith(
                              color: AppColors.textColor1, fontSize: 4.sp),
                        ),
                      ),
                      5.horizontalSpace,
                      SizedBox(
                        // width: 0.1.sw,
                        child: Text(
                          '|',
                          style: Style.regular16ptb.copyWith(
                              color: AppColors.textColor1, fontSize: 4.sp),
                        ),
                      ),
                      5.horizontalSpace,
                      SizedBox(
                        width: 0.1.sw,
                        child: Text(
                          dataRecieved['month'],
                          overflow: TextOverflow.ellipsis,
                          style: Style.regular16ptb.copyWith(
                              color: AppColors.textColor1, fontSize: 4.sp),
                        ),
                      ),
                      5.horizontalSpace,
                      SizedBox(
                        // width: 0.1.sw,
                        child: Text(
                          '|',
                          style: Style.regular16ptb.copyWith(
                              color: AppColors.textColor1, fontSize: 4.sp),
                        ),
                      ),
                      5.horizontalSpace,
                      SizedBox(
                        width: 0.1.sw,
                        child: TextButton(
                          onPressed: () {
                            vModel.launchURL(
                                dataRecieved['challanUrl'].toString());
                          },
                          child: Text(
                            'Tap to View',
                            style: Style.regular16ptb.copyWith(
                                color: AppColors.textColor1, fontSize: 4.sp),
                          ),
                        ),
                      ),
                      // 10.verticalSpace,
                    ],
                  ),
                ),
              ),
              10.horizontalSpace,
              // ElevatedButton.icon(onPressed: (){}, label: label)
              IconButton.filled(
                onPressed: () {
                  vModel.deleteChallan(dataRecieved['uid'].toString());
                },
                icon: const Icon(Icons.check),
              ),
            ],
          ),
        );
      },
    );
  }
}
