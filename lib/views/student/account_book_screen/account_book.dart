// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/theme/button_style.dart';
import 'package:srs_fyp_2024/views/student/account_book_screen/account_book_vm.dart';
import 'package:srs_fyp_2024/views/student/account_book_screen/widgets/account_drawer.dart';

import 'package:stacked/stacked.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';

class AccountBookScreen extends StatelessWidget {
  const AccountBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.initialize(),
      viewModelBuilder: () => AccountBookVM(),
      builder: (context, vModel, child) {
        return vModel.isBusy
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.buttonColor,
                  ),
                ),
              )
            : Scaffold(
                resizeToAvoidBottomInset: false,
                body: SafeArea(
                  child: SizedBox(
                    width: 1.sw,
                    child: Row(
                      children: [
                        const AccountDrawer(),
                        SizedBox(
                          child: SingleChildScrollView(
                            child: SizedBox(
                              width: 0.8.sw,
                              height: 1.sh,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  20.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.only(left: 0.04.sw),
                                    child: Text(
                                      'Fees',
                                      style: Style.semiBold20ptb.copyWith(
                                          color: AppColors.textColor1,
                                          fontSize: 8.sp),
                                    ),
                                  ),
                                  20.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 0.04.sw),
                                    child: TextField(
                                      controller: vModel.currentMonth,
                                      maxLines: 1,
                                      keyboardType: TextInputType.emailAddress,
                                      style: Style.regular14ptb.copyWith(
                                        fontSize: 5.sp,
                                        color: AppColors.textColor1,
                                      ),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        hintText: 'Current Month',
                                        hintStyle: Style.regular14ptb.copyWith(
                                            color: AppColors.textColor1,
                                            fontSize: 5.sp),
                                        fillColor: AppColors.secondaryColor,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: AppColors.secondaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: AppColors.primaryColor,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  20.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 0.04.sw),
                                    child: TextField(
                                      // controller:
                                      //     vModel.passwordController,
                                      controller: vModel.currentFees,
                                      maxLines: 1,
                                      keyboardType: TextInputType.emailAddress,
                                      style: Style.regular14ptb.copyWith(
                                        fontSize: 5.sp,
                                        color: AppColors.textColor1,
                                      ),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        hintText: 'Current Fees',
                                        hintStyle: Style.regular14ptb.copyWith(
                                            color: AppColors.textColor1,
                                            fontSize: 5.sp),
                                        fillColor: AppColors.secondaryColor,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: AppColors.secondaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: AppColors.primaryColor,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  20.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 0.04.sw),
                                    child: TextField(
                                      controller: vModel.dueDate,
                                      maxLines: 1,
                                      keyboardType: TextInputType.emailAddress,
                                      style: Style.regular14ptb.copyWith(
                                        fontSize: 5.sp,
                                        color: AppColors.textColor1,
                                      ),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        hintText: 'Due Date',
                                        hintStyle: Style.regular14ptb.copyWith(
                                            color: AppColors.textColor1,
                                            fontSize: 5.sp),
                                        fillColor: AppColors.secondaryColor,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: AppColors.secondaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: AppColors.primaryColor,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (vModel.isFeesPaid == true)
                                    20.verticalSpace,
                                  if (vModel.isFeesPaid == true)
                                    Container(
                                      margin: EdgeInsets.only(left: 0.04.sw),
                                      child: Text(
                                        'Paid Fees Challan Submitted',
                                        style: Style.regular14ptb.copyWith(
                                          fontSize: 5.sp,
                                          color: AppColors.textColor1,
                                        ),
                                      ),
                                    ),
                                  if (vModel.isFeesPaid == false)
                                    20.verticalSpace,
                                  if (vModel.isFeesPaid == false)
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 0.04.sw),
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                child: Text(
                                                  'Upload Paid Fee Challan:',
                                                  style: Style.regular14ptb
                                                      .copyWith(
                                                    fontSize: 5.sp,
                                                    color: AppColors.textColor1,
                                                  ),
                                                ),
                                              ),
                                              5.verticalSpace,
                                              vModel.isImage == true
                                                  ? Center(
                                                      child: SizedBox(
                                                        width: 200.h,
                                                        height: 200.h,
                                                        child: Image.network(
                                                          vModel
                                                              .isImageUploaded,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    )
                                                  : SizedBox(
                                                      child: Text(
                                                        'No Image Selected',
                                                        style: Style
                                                            .regular14ptb
                                                            .copyWith(
                                                          fontSize: 5.sp,
                                                          color: AppColors
                                                              .textColor1,
                                                        ),
                                                      ),
                                                    ),
                                            ],
                                          ),
                                          const Spacer(),
                                          vModel.isImage == false
                                              ? Container(
                                                  margin: EdgeInsets.only(
                                                      left: 0.04.sw),
                                                  child: ElevatedButton(
                                                    style: CustomButtonStyle
                                                        .b5style,
                                                    onPressed: () {
                                                      vModel.uploadApiImage();
                                                    },
                                                    child: Text(
                                                      'Upload',
                                                      style: Style.regular14ptb
                                                          .copyWith(
                                                              fontSize: 6.sp),
                                                    ),
                                                  ),
                                                )
                                              : Column(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 0.04.sw),
                                                      child: ElevatedButton(
                                                        style: CustomButtonStyle
                                                            .b5style,
                                                        onPressed: () {
                                                          vModel
                                                              .uploadApiImage();
                                                        },
                                                        child: Text(
                                                          'Change',
                                                          style: Style
                                                              .regular14ptb
                                                              .copyWith(
                                                                  fontSize:
                                                                      6.sp),
                                                        ),
                                                      ),
                                                    ),
                                                    10.verticalSpace,
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 0.04.sw),
                                                      child: ElevatedButton(
                                                        style: CustomButtonStyle
                                                            .b5style,
                                                        onPressed: () {
                                                          vModel.add();
                                                        },
                                                        child: Text(
                                                          'Submit',
                                                          style: Style
                                                              .regular14ptb
                                                              .copyWith(
                                                                  fontSize:
                                                                      6.sp),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                        ],
                                      ),
                                    ),
                                  const Spacer(),
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
      },
    );
  }
}
