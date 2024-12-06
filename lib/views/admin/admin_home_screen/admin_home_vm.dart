import 'dart:developer';
import 'dart:typed_data';
import 'dart:html' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:srs_fyp_2024/app/app.locator.dart';
import 'package:srs_fyp_2024/app/app.router.dart';
import 'package:srs_fyp_2024/services/student_user.dart';
import 'package:srs_fyp_2024/services/upload_image_api.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../theme/fonts_style.dart';

class AdminHomeVM extends BaseViewModel {
  final navigationService = NavigationService();
  String logo = "assets/logo/Logo.png";
  TextEditingController resNoController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController feesController = TextEditingController();
  TextEditingController rollNumController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController course1 = TextEditingController();
  TextEditingController course2 = TextEditingController();
  TextEditingController course3 = TextEditingController();
  TextEditingController course4 = TextEditingController();
  TextEditingController course5 = TextEditingController();
  TextEditingController course6 = TextEditingController();
  TextEditingController course7 = TextEditingController();
  TextEditingController course8 = TextEditingController();
  TextEditingController course9 = TextEditingController();
  TextEditingController course10 = TextEditingController();
  TextEditingController grade1 = TextEditingController();
  TextEditingController grade2 = TextEditingController();
  TextEditingController grade3 = TextEditingController();
  TextEditingController grade4 = TextEditingController();
  TextEditingController grade5 = TextEditingController();
  TextEditingController grade6 = TextEditingController();
  TextEditingController grade7 = TextEditingController();
  TextEditingController grade8 = TextEditingController();
  TextEditingController grade9 = TextEditingController();
  TextEditingController grade10 = TextEditingController();
  List grades_with_course_name = [];

  List allTextField = [];

  List displayTextfield = [];

  StudentUser studentUser = locator<StudentUser>();

  initialize() async {
    await getMonth();
    // await getCourse();
    allTextField = [
      {
        'label': 'Course 1',
        'course_value': course1,
        'grade_value': grade1,
        'course_textfield': TextFormField(
          controller: course1,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Course Name',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
        'grade_textfield': TextFormField(
          controller: grade1,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Grade',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
      },
      {
        'label': 'Course 2',
        'course_value': course2,
        'grade_value': grade2,
        'course_textfield': TextFormField(
          controller: course2,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Course Name',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
        'grade_textfield': TextFormField(
          controller: grade2,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Grade',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
      },
      {
        'label': 'Course 3',
        'course_value': course3,
        'grade_value': grade3,
        'course_textfield': TextFormField(
          controller: course3,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Course Name',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
        'grade_textfield': TextFormField(
          controller: grade3,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Grade',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
      },
      {
        'label': 'Course 4',
        'course_value': course4,
        'grade_value': grade4,
        'course_textfield': TextFormField(
          controller: course4,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Course Name',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
        'grade_textfield': TextFormField(
          controller: grade4,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Grade',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
      },
      {
        'label': 'Course 5',
        'course_value': course5,
        'grade_value': grade5,
        'course_textfield': TextFormField(
          controller: course5,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Course Name',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
        'grade_textfield': TextFormField(
          controller: grade5,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Grade',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
      },
      {
        'label': 'Course 6',
        'course_value': course6,
        'grade_value': grade6,
        'course_textfield': TextFormField(
          controller: course6,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Course Name',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
        'grade_textfield': TextFormField(
          controller: grade6,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Grade',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
      },
      {
        'label': 'Course 7',
        'course_value': course7,
        'grade_value': grade7,
        'course_textfield': TextFormField(
          controller: course7,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Course Name',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
        'grade_textfield': TextFormField(
          controller: grade7,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Grade',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
      },
      {
        'label': 'Course 8',
        'course_value': course8,
        'grade_value': grade8,
        'course_textfield': TextFormField(
          controller: course8,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Course Name',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
        'grade_textfield': TextFormField(
          controller: grade8,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Grade',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
      },
      {
        'label': 'Course 9',
        'course_value': course9,
        'grade_value': grade9,
        'course_textfield': TextFormField(
          controller: course9,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Course Name',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
        'grade_textfield': TextFormField(
          controller: grade9,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Grade',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
      },
      {
        'label': 'Course 10',
        'course_value': course10,
        'grade_value': grade10,
        'course_textfield': TextFormField(
          controller: course10,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Course Name',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
        'grade_textfield': TextFormField(
          controller: grade10,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Grade',
            hintStyle: Style.regular14ptb
                .copyWith(color: AppColors.textColor1, fontSize: 5.sp),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            return null;
          },
        ),
      },
    ];
  }

  addCourse() {
    if (allTextField.length == displayTextfield.length) {
      return;
    } else {
      displayTextfield.add(allTextField[displayTextfield.length]);
    }
    notifyListeners();
  }

  removeCourse() {
    if (displayTextfield.isNotEmpty) {
      displayTextfield.removeLast();
    }
    notifyListeners();
  }

  getMonth() {
    switch (DateTime.now().month) {
      case 1:
        monthController.text = 'January';
      case 2:
        monthController.text = 'Februray';
      case 3:
        monthController.text = 'March';
      case 4:
        monthController.text = 'April';
      case 5:
        monthController.text = 'May';
      case 6:
        monthController.text = 'June';
      case 7:
        monthController.text = 'July';
      case 8:
        monthController.text = 'August';
      case 9:
        monthController.text = 'September';
      case 10:
        monthController.text = 'October';
      case 11:
        monthController.text = 'November';
      case 12:
        monthController.text = 'December';
      default:
        monthController.text = 'Error';
    }
  }

  final formkey = GlobalKey<FormState>();
  SnackbarService snackBarService = SnackbarService();

  addGrades() {
    Map data = {};
    for (int i = 0; i < displayTextfield.length; i++) {
      TextEditingController course_value = displayTextfield[i]['course_value'];
      TextEditingController grade_value = displayTextfield[i]['grade_value'];
      data = {'course_name': course_value.text, 'grade': grade_value.text};
      grades_with_course_name.add(data);
    }
    print(grades_with_course_name);
  }

  clearGrades() {
    rollNumController.clear();
    grade1.clear();
    grade2.clear();
    grade3.clear();
    grade4.clear();
    grade5.clear();
    grade6.clear();
    grade7.clear();
    grade8.clear();
    grade9.clear();
    grade10.clear();
    course1.clear();
    course2.clear();
    course3.clear();
    course4.clear();
    course5.clear();
    course6.clear();
    course7.clear();
    course8.clear();
    course9.clear();
    course10.clear();
    notifyListeners();
  }

  addGradesToDB(rollNum) async {
    CollectionReference student =
        FirebaseFirestore.instance.collection('grades');
    await addGrades();
    return student
        .doc(rollNum)
        .set(
          {'rollNum': rollNum, 'grades': grades_with_course_name},
        )
        .then(
          (value) => log("Grades Added"),
        )
        .catchError(
          (error) {
            snackBarService.showSnackbar(
              message: error,
              title: 'Error',
              duration: const Duration(seconds: 2),
            );
          },
        );
  }

  addSalaryToDB(resNo) async {
    CollectionReference student =
        FirebaseFirestore.instance.collection('salary');
    return student
        .doc(resNo)
        .set(
          {'resNo': resNo, 'salary': salaryController.text},
        )
        .then(
          (value) => log("Salary Added"),
        )
        .catchError(
          (error) {
            snackBarService.showSnackbar(
              message: error,
              title: 'Error',
              duration: const Duration(seconds: 2),
            );
          },
        );
  }

  addFeesToDB(classNo) async {
    CollectionReference student = FirebaseFirestore.instance.collection('fees');
    return student
        .doc(classNo)
        .set(
          {
            'classNo': classNo,
            'Fees': feesController.text,
            'month': monthController.text,
            'dueDate': dueDateController.text
          },
        )
        .then(
          (value) => log("Fees Added"),
        )
        .catchError(
          (error) {
            snackBarService.showSnackbar(
              message: error,
              title: 'Error',
              duration: const Duration(seconds: 2),
            );
          },
        );
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isLogin');
    prefs.remove('role');
    prefs.remove('documentID');
    notifyListeners();
    navigationService.navigateToLoginScreen();
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

  Uint8List? pickedPdf;
  String? pdfName;
  String isPdfUploaded = "";
  bool isUploaded = false;

  pickFile() async {
    isUploaded = false;
    notifyListeners();
    var result = await FilePicker.platform.pickFiles();

    if (result != null) {
      pickedPdf = result.files.first.bytes;
      pdfName = result.files.first.name;
      debugPrint("going in");
      setBusy(true);
      await UploadApiImage().uploadImage(pickedPdf!, pdfName!).then((value) {
        debugPrint("inside");
        isUploaded = true;
        isPdfUploaded = value['location'].toString();
        debugPrint("Updated Successfully with link ${value.toString()}");
        debugPrint("Location: $isPdfUploaded");
      }).onError((error, stackTrace) {
        debugPrint(error.toString());
      });
      debugPrint("outside");
      notifyListeners();
      setBusy(false);
      // Upload file
    } else {
      return;
    }
  }

  SnackbarService snackbarService = SnackbarService();

  addETTToDB(classNo, path) async {
    CollectionReference timetable =
        FirebaseFirestore.instance.collection('Exam Timetable');
    return timetable.doc(classNo).set(
      {
        'doc': path,
      },
    ).then(
      (value) {
        log("Exam Timetable Added");
        snackbarService.showSnackbar(
          message: 'Exam Timetable Added',
          duration: const Duration(seconds: 2),
        );
      },
    ).catchError(
      (error) {
        snackbarService.showSnackbar(
          message: error,
          title: 'Error',
          duration: const Duration(seconds: 2),
        );
      },
    );
  }

  openFile() {
    html.window.open(isPdfUploaded, 'new tab');
  }
}
