// import 'dart:developer';
import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:srs_fyp_2024/app/app.locator.dart';
import 'package:srs_fyp_2024/services/student_user.dart';
import 'package:srs_fyp_2024/services/upload_image_api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AccountBookVM extends BaseViewModel {
  StudentUser studentUser = locator<StudentUser>();
  Map<String, dynamic> feesBook = {};
  TextEditingController currentFees = TextEditingController();
  TextEditingController currentMonth = TextEditingController();
  TextEditingController dueDate = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;
  Map userData = {};
  SnackbarService snackbarService = SnackbarService();

  Future<DocumentSnapshot> getUser() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('schoolStudents')
        .doc(user!.uid)
        .get();

    userData = snapshot.data() as Map<String, dynamic>;
    notifyListeners();
    return snapshot;
  }

  Future<DocumentSnapshot> getFees() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('fees')
        .doc(studentUser.classNo)
        .get();

    feesBook = snapshot.data() as Map<String, dynamic>;
    notifyListeners();
    return snapshot;
  }

  initialize() async {
    setBusy(true);
    await getFees();
    checkFeesPaid();
    currentMonth.text = feesBook['month'] ?? 'Not Added';
    currentFees.text = feesBook['Fees'] ?? 'Not Added';
    dueDate.text = feesBook['dueDate'] ?? 'Not Added';
    notifyListeners();
    setBusy(false);
  }

  String isImageUploaded = "";
  bool isImage = false;

  uploadApiImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    Uint8List bytes = await image!.readAsBytes();

    await UploadApiImage().uploadImage(bytes, image.name).then((value) {
      isImageUploaded = value['location'].toString();
      debugPrint("Updated Successfully with link ${value.toString()}");
      debugPrint("Location: $isImageUploaded");
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });
    isImage = true;
    notifyListeners();
  }

  bool isFeesPaid = false;

  Future<void> checkFeesPaid() async {
    CollectionReference feesPaid =
        FirebaseFirestore.instance.collection('feesPaid');
    final user = FirebaseAuth.instance.currentUser;
    DocumentReference docRef = feesPaid.doc(user!.uid);
    DocumentSnapshot doc = await docRef.get();
    print('isFeePaid Before Check: $isFeesPaid');

    if (doc.exists) {
      isFeesPaid = true;
      print('isFeePaid After Check: $isFeesPaid');
      notifyListeners();
    }
  }

  add() async {
    await addFeesChallanToDB();
    isFeesPaid = true;
    notifyListeners();
  }

  addFeesChallanToDB() async {
    CollectionReference feesPaid =
        FirebaseFirestore.instance.collection('feesPaid');
    final user = FirebaseAuth.instance.currentUser;

    return await feesPaid
        .doc(user!.uid)
        .set(
          {
            'month': currentMonth.text,
            'challanUrl': isImageUploaded.toString(),
            'rollNum': studentUser.rollNum,
            'name': studentUser.userData['name'].toString(),
            'uid': user.uid.toString(),
          },
        )
        .then(
          (value) => log("Fees Added"),
        )
        .catchError(
          (error) {
            snackbarService.showSnackbar(
              message: error,
              title: 'Error',
              duration: const Duration(seconds: 2),
            );
          },
        );
  }
}
