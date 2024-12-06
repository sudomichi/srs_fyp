import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class FeesChallanVM extends BaseViewModel {
  SnackbarService snackbarService = SnackbarService();

  CollectionReference feesPaid =
      FirebaseFirestore.instance.collection('feesPaid');

  launchURL(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> deleteChallan(uid) async {
    log('inside');
    CollectionReference feesPaid =
        FirebaseFirestore.instance.collection('feesPaid');

    // Call the user's CollectionReference to add a new user
    return feesPaid
        .doc(uid)
        .delete()
        .then(
          (value) => log("Challan Deleted"),
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
