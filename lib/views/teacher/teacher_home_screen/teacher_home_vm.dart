import 'dart:developer';
import 'dart:typed_data';
import 'dart:html' as html;
// import 'dart:typed_data';

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
import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TeacherHomeVM extends BaseViewModel {
  final navigationService = NavigationService();
  String logo = "assets/logo/Logo.png";
  String person = 'assets/logo/Student.png';
  final user = FirebaseAuth.instance.currentUser;
  StudentUser studentUser = locator<StudentUser>();
  Map<String, dynamic> userData = {};
  List<String> courses = [];
  List course = [];

  Future<DocumentSnapshot> getUser() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('schoolStudents')
        .doc(user!.uid)
        .get();

    userData = snapshot.data() as Map<String, dynamic>;
    studentUser.userData = userData;
    studentUser.resNo = userData['resNo'];
    studentUser.imageUrl = userData['imageUrl'];
    log(studentUser.resNo);
    notifyListeners();
    return snapshot;
  }

  getCourse() async {
    Map<String, dynamic> singleData = {};
    List dataList = [];
    await FirebaseFirestore.instance.collection('course').get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        singleData = value.docs[i].data();
        dataList.add(singleData);
      }
    });
    studentUser.classList = dataList;
    notifyListeners();
  }

  initialize() async {
    setBusy(true);
    await getUser();
    getCourse();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', userData['role']);
    setBusy(false);
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

  addAssToDB(classNo, subject, assNo, path) async {
    CollectionReference assignemnt =
        FirebaseFirestore.instance.collection('Assignment');
    return assignemnt.doc(classNo).collection(subject).doc(assNo).set(
      {
        'assNo': assNo,
        'subject': subject,
        'classNo': classNo,
        'doc': path,
      },
    ).then(
      (value) {
        log("Assignment Added");
        snackbarService.showSnackbar(
          message: 'Assignment Added',
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
