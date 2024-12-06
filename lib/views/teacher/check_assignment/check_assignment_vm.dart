import 'dart:developer';
import 'dart:html' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/app/app.locator.dart';
import 'package:srs_fyp_2024/services/student_user.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CheckAssignmentVM extends BaseViewModel {
  SnackbarService snackbarService = SnackbarService();

  CollectionReference assignmentSol =
      FirebaseFirestore.instance.collection('Assignment Solution');

  openUploadedAssignment(docLink) {
    html.window.open(docLink, 'new tab');
  }

  List<String> courses = [];
  List course = [];
  StudentUser studentUser = locator<StudentUser>();

  getCoursesForClass(classNo) {
    courses = [];
    for (int i = 0; i < studentUser.classList.length; i++) {
      if (classNo == studentUser.classList[i]['class']) {
        for (int j = 0; j < studentUser.classList[i]['course'].length; j++) {
          courses.add(studentUser.classList[i]['course'][j]);
        }
        log('course: $courses');
        notifyListeners();
      }
    }
  }

  final List<String> assignment = [
    'Assignment 1',
    'Assignment 2',
    'Assignment 3',
  ];
  String? selectedAssignment;

  Widget dropdownAssignment() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text('Select Assignment Number',
            style: Style.regular14ptb
                .copyWith(fontSize: 4.sp, color: AppColors.textColor1)),
        items: assignment
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedAssignment,
        onChanged: (String? value) {
          selectedAssignment = value;
          rebuildUi();
        },
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 0.1.sh,
          width: 0.7.sw,
          // overlayColor: WidgetStatePropertyAll(AppColors.secondaryColor),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }

  final List<String> classes = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];
  String? selectedClass;

  Widget dropdownClass() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          'Select Class',
          style: Style.regular14ptb
              .copyWith(fontSize: 4.sp, color: AppColors.textColor1),
        ),
        items: classes
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedClass,
        onChanged: (String? value) {
          selectedClass = value;
          getCoursesForClass(value);
          rebuildUi();
        },
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 0.1.sh,
          width: 0.7.sw,
          // overlayColor: WidgetStatePropertyAll(AppColors.secondaryColor),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }

  String? selectedCourse;

  Widget dropdownCourse() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text('Select Subject',
            style: Style.regular14ptb
                .copyWith(fontSize: 4.sp, color: AppColors.textColor1)),
        items: courses
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedCourse,
        onChanged: (String? value) {
          selectedCourse = value;
          rebuildUi();
        },
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 0.1.sh,
          width: 0.7.sw,
          // overlayColor: WidgetStatePropertyAll(AppColors.secondaryColor),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }

  clear() {
    selectedAssignment = null;
    selectedClass = null;
    selectedCourse = null;
    rebuildUi();
  }
}
