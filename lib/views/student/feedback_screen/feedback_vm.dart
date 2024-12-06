import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:srs_fyp_2024/app/app.locator.dart';
import 'package:srs_fyp_2024/services/student_user.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FeedbackVM extends BaseViewModel {
  TextEditingController teacherController = TextEditingController();
  TextEditingController rollnumController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();
  StudentUser studentUser = locator<StudentUser>();
  SnackbarService snackBarService = SnackbarService();

  initialize() {
    rollnumController.text = studentUser.userData['rollNum'];
    emailController.text = studentUser.userData['email'];
    notifyListeners();
  }

  clear() {
    teacherController.clear();

    feedbackController.clear();
    notifyListeners();
  }

  addFeedbackToDB() async {
    CollectionReference student =
        FirebaseFirestore.instance.collection('feedback');
    return student
        .doc()
        .set(
          {
            'teacherName': teacherController.text,
            'rollNum': rollnumController.text,
            'email': emailController.text,
            'feedback': feedbackController.text
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
}
