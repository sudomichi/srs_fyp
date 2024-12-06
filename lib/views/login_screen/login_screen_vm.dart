// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:srs_fyp_2024/app/app.locator.dart';
import 'package:srs_fyp_2024/app/app.router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenVM extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  String logo = 'assets/logo/Logo.png';
  String image = 'assets/logo/Student_Login.jpg';
  NavigationService navigationService = locator<NavigationService>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final snackBarService = SnackbarService();
  Map<String, dynamic> userData = {};
  // final user = FirebaseAuth.instance.currentUser;

  bool obscureText = true;

  void toggleObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  isLoggedin(UserCredential credential) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', true);
    await prefs.setString('documentID', credential.user!.uid.toString());
    log('Logged in');
  }

  Future<DocumentSnapshot> getUser(uid) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('schoolStudents')
        .doc(uid)
        .get();

    userData = snapshot.data() as Map<String, dynamic>;
    notifyListeners();
    return snapshot;
  }

  navigateToRegister() {
    navigationService.navigateToRegisterScreen();
  }

  clear() {
    emailController.clear();
    passwordController.clear();
    notifyListeners();
  }

  checkSignIn() async {
    if (emailController.text == 'admin' && passwordController.text == 'admin') {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLogin', true);
      await prefs.setString('role', 'Admin');
      navigationService.replaceWithAdminHomeScreen();
    } else {
      signInUser();
    }
    // log(emailController.text);
    // log(passwordController.text);
  }

  signInUser() async {
    setBusy(true);
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // isLoggedin(credential);
      Future.delayed(
        const Duration(milliseconds: 1500),
      );
      await getUser(credential.user!.uid);
      isLoggedin(credential);
      clear();
      setBusy(false);

      if (userData['role'] == "Student") {
        navigationService.replaceWithStudentHomeScreen();
      } else {
        navigationService.replaceWithTeacherHomeScreen();
      }
      // navigateToView();
      log('SignedIn');
    } on FirebaseAuthException catch (e) {
      setBusy(false);
      if (e.code == 'invalid-credential') {
        snackBarService.showSnackbar(
          message: 'Invalid Credentials.',
          title: 'Error',
          duration: const Duration(seconds: 1),
        );
      } else if (e.code == 'network-request-failed') {
        snackBarService.showSnackbar(
          message: 'Network timeout.',
          title: 'Error',
          duration: const Duration(seconds: 1),
        );
      }
      log(e.code);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }
}
