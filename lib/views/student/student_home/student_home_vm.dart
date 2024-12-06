import 'dart:developer';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srs_fyp_2024/services/upload_image_api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:srs_fyp_2024/app/app.locator.dart';
import 'package:srs_fyp_2024/app/app.router.dart';
import 'package:srs_fyp_2024/services/student_user.dart';
// import 'package:srs_fyp_2024/main.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';

class StudentHomeVM extends BaseViewModel {
  final navigationService = NavigationService();
  String logo = "assets/logo/Logo.png";
  String person = 'assets/logo/Student.png';
  CollectionReference student =
      FirebaseFirestore.instance.collection('schoolStudents');
  final user = FirebaseAuth.instance.currentUser;
  StudentUser studentUser = locator<StudentUser>();
  Map<String, dynamic> userData = {};
  List course = [];
  List<String> courseList = [];
  String fees = '';
  Map<String, dynamic> feesBook = {};
  Map<String, dynamic> assData = {};
  Map<String, dynamic> eTTData = {};

  Future<DocumentSnapshot> getFees() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('fees')
        .doc(studentUser.classNo)
        .get();

    feesBook = snapshot.data() as Map<String, dynamic>;
    notifyListeners();
    return snapshot;
  }

  bool? noDocument;
  bool? alreadyUploaded;
  bool? noTimeTable;

  Future<DocumentSnapshot> getETT() async {
    CollectionReference ETT =
        FirebaseFirestore.instance.collection('Exam Timetable');

    DocumentReference docRef = ETT.doc(studentUser.classNo);
    DocumentSnapshot doc = await docRef.get();

    if (doc.exists) {
      noTimeTable = false;
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Exam Timetable')
          .doc(studentUser.classNo)
          .get();

      if (snapshot.data() != null) {
        eTTData = snapshot.data() as Map<String, dynamic>;
      }
      // print(eTTData);
      notifyListeners();
    } else {
      noTimeTable = true;
      notifyListeners();
    }

    setBusy(false);
    return doc;
  }

  Future<DocumentSnapshot> getAssignment(
      selectedCourse, selectedAssignment) async {
    setBusy(true);
    CollectionReference assignment =
        FirebaseFirestore.instance.collection('Assignment');

    DocumentReference docRef = assignment
        .doc(studentUser.classNo)
        .collection(selectedCourse)
        .doc(selectedAssignment);
    DocumentSnapshot doc = await docRef.get();

    CollectionReference assignmentSol =
        FirebaseFirestore.instance.collection('Assignment Solution');

    DocumentReference docRef2 = assignmentSol
        .doc(studentUser.classNo)
        .collection("$selectedCourse - $selectedAssignment")
        .doc(studentUser.rollNum);
    DocumentSnapshot doc2 = await docRef2.get();

    if (doc2.exists) {
      alreadyUploaded = true;
    } else {
      if (doc.exists) {
        alreadyUploaded = false;
        noDocument = false;
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('Assignment')
            .doc(studentUser.classNo)
            .collection(selectedCourse)
            .doc(selectedAssignment)
            .get();

        if (snapshot.data() != null) {
          assData = snapshot.data() as Map<String, dynamic>;
        }
        print(assData);
        notifyListeners();
      } else {
        noDocument = true;
        notifyListeners();
      }
    }
    setBusy(false);
    return doc;
  }

  openFile() {
    html.window
        .open(assData['doc'], '${assData['subject']} - ${assData['assNo']}');
  }

  Future<DocumentSnapshot> getUser() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('schoolStudents')
        .doc(user!.uid)
        .get();

    userData = snapshot.data() as Map<String, dynamic>;
    studentUser.userData = userData;
    studentUser.classNo = userData['class'];
    studentUser.rollNum = userData['rollNum'];
    studentUser.imageUrl = userData['imageUrl'];
    notifyListeners();
    return snapshot;
  }

  getCourse() async {
    Map<String, dynamic> singleData = {};
    List dataList = [];
    await FirebaseFirestore.instance.collection('course').get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        singleData = value.docs[i].data();
        // log(singleData.toString());
        dataList.add(singleData);
        // log(dataList.toString());
        // studentUser.classList = dataList;
        // log(dataList[i].toString());

        // notifyListeners();
      }
    });
    studentUser.classList = dataList;
    notifyListeners();
    // log(userService.allLawyersData.toString());
  }

  getCoursesForClass() {
    for (int i = 0; i < studentUser.classList.length; i++) {
      if (userData['class'] == studentUser.classList[i]['class']) {
        course = studentUser.classList[i]['course'];
        fees = studentUser.classList[i]['fees'];
        studentUser.course = studentUser.classList[i]['course'];
        studentUser.estimatedFees = studentUser.classList[i]['fees'];
        // log('Hellloo');
        // log("e-fees: ${studentUser.estimatedFees}");
        // log("fees: $fees");
        // log('e-course: ${studentUser.course}');
        // log('course: $course');
        notifyListeners();
      }
    }
  }

  addCourseList() {
    for (int i = 0; i < course.length; i++) {
      courseList.add(course[i]);
    }
  }

  initialize() async {
    setBusy(true);
    await getUser();
    await getCourse();
    await getFees();
    await getCoursesForClass();
    await addCourseList();
    await getETT();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', userData['role']);
    setBusy(false);
  }

  navigateToSplash() {
    navigationService.navigateToSplashScreen();
  }

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedCourse;

  Widget dropdownCourse() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text('Select Subject',
            style: Style.regular14ptb
                .copyWith(fontSize: 4.sp, color: AppColors.textColor1)),
        items: courseList
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

  signOut() async {
    await FirebaseAuth.instance.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isLogin');
    prefs.remove('role');
    prefs.remove('documentID');
    notifyListeners();
    navigationService.navigateToLoginScreen();
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

  addAssSolToDB(subject, assNo, path) async {
    CollectionReference assignemnt =
        FirebaseFirestore.instance.collection('Assignment Solution');
    return assignemnt
        .doc(studentUser.classNo)
        .collection("$subject - $assNo")
        .doc(studentUser.rollNum)
        .set(
      {
        'assNo': assNo,
        'subject': subject,
        'classNo': studentUser.classNo,
        'rollNo': studentUser.rollNum,
        'studentName': userData['name'],
        'doc': path,
      },
    ).then(
      (value) {
        log("Assignment Added");
        snackbarService.showSnackbar(
          message: 'Assignment Added',
          duration: const Duration(seconds: 2),
        );
        isUploaded = false;
        isPdfUploaded = "";
        noDocument = null;
        notifyListeners();
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

  openUploadedAssignment() {
    html.window.open(isPdfUploaded, 'new tab');
  }

  openTimeTable() {
    html.window.open(eTTData['doc'], 'new tab');
  }
}
