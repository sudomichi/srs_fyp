// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/widgets/custom_tfvm.dart';
import 'package:stacked/stacked.dart';

import '../theme/fonts_style.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final Widget? suffix;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  const CustomTextField(
      {super.key,
      this.keyboardType,
      this.suffix,
      required this.controller,
      required this.hintText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CustomTFVM(),
      builder: (context, vModel, child) {
        return TextFormField(
          readOnly: hintText == 'Rating' ? true : false,
          maxLines: hintText == 'Bio' || hintText == 'Describe your problem'
              ? null
              : 1,
          keyboardType: keyboardType,
          obscureText: hintText == 'Password' || hintText == 'Confirm Password'
              ? vModel.obscureText
              : false,
          controller: controller,
          style: Style.regular14ptb,
          decoration: InputDecoration(
            filled: true,
            hintText: hintText,
            suffix: suffix,
            suffixIcon: hintText == 'Password' || hintText == 'Confirm Password'
                ? InkWell(
                    onTap: () => vModel.toggleObscureText(),
                    child: Icon(
                      vModel.obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: const Color(0xff626262),
                    ),
                  )
                : null,
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 4.sp),
            fillColor: const Color(0xff626262).withOpacity(0.10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: const Color(0xff626262).withOpacity(0.10),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 3,
              ),
            ),
          ),
          validator: validator,
        );
      },
    );
  }
}
