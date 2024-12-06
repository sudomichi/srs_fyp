import 'package:flutter/material.dart';
import 'package:srs_fyp_2024/theme/color.dart';

class CustomButtonStyle {
  static var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.buttonColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  static var b2style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.buttonColor,
    fixedSize: const Size(180, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  static var b3style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.buttonColor,
    fixedSize: const Size(120, 40),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  );

  static var b4style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.buttonColor,
    fixedSize: const Size(200, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  );

  static var b5style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.buttonColor,
    fixedSize: const Size(200, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  static var b6style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.buttonColor,
    fixedSize: const Size(260, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  static var b3style_outlined = ElevatedButton.styleFrom(
      // backgroundColor: AppColors.buttonColor,
      fixedSize: const Size(120, 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      side: const BorderSide(color: AppColors.buttonColor, width: 2));
}
