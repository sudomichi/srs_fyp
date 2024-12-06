import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:srs_fyp_2024/app/app.locator.dart';
import 'package:srs_fyp_2024/services/student_user.dart';
import 'package:stacked/stacked.dart';

class CheckSalaryVM extends BaseViewModel {
  Map<String, dynamic> userData = {};
  StudentUser studentUser = locator<StudentUser>();

  TextEditingController month = TextEditingController();
  TextEditingController salary = TextEditingController();

  Future<DocumentSnapshot> getSalary() async {
    String resNo = studentUser.resNo;
    print('resNo: $resNo');
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('salary').doc(resNo).get();

    userData = snapshot.data() as Map<String, dynamic>;
    notifyListeners();
    return snapshot;
  }

  getMonth() {
    switch (DateTime.now().month) {
      case 1:
        month.text = 'January';
      case 2:
        month.text = 'Februray';
      case 3:
        month.text = 'March';
      case 4:
        month.text = 'April';
      case 5:
        month.text = 'May';
      case 6:
        month.text = 'June';
      case 7:
        month.text = 'July';
      case 8:
        month.text = 'August';
      case 9:
        month.text = 'September';
      case 10:
        month.text = 'October';
      case 11:
        month.text = 'November';
      case 12:
        month.text = 'December';
      default:
        month.text = 'Error';
    }
  }

  initialize() async {
    setBusy(true);
    await getSalary();
    await getMonth();
    salary.text = userData['salary'] ?? 'Not Added';
    notifyListeners();
    // print(studentUser.resNo);
    setBusy(false);
  }
}
