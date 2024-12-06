import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:srs_fyp_2024/app/app.locator.dart';
import 'package:srs_fyp_2024/services/student_user.dart';
import 'package:stacked/stacked.dart';

class GradesBookVM extends BaseViewModel {
  StudentUser studentUser = locator<StudentUser>();
  TextEditingController classNum = TextEditingController();
  TextEditingController rollNum = TextEditingController();
  Map gradeBook = {};
  List grades = [];
  List course = [];

  CollectionReference grade = FirebaseFirestore.instance.collection('grades');

  // Future<DocumentSnapshot> getUser() async {
  //   DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('grades')
  //       .doc(studentUser.rollNum)
  //       .get();

  //   gradeBook = snapshot.data() as Map<String, dynamic>;
  //   grade = gradeBook['grades'];
  //   print(gradeBook);
  //   for (int i = 0; i < grade.length; i++) {
  //     grades.add(grade[i]['grade']);
  //     course.add(grade[i]['course_name']);
  //   }
  //   print(grades);
  //   print(course);
  //   notifyListeners();
  //   return snapshot;
  // }

  initialize() async {
    setBusy(true);
    // await getUser();
    classNum.text = studentUser.classNo;
    rollNum.text = studentUser.rollNum;
    setBusy(false);
  }
}
