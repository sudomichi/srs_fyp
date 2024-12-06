import 'dart:developer';
import 'package:srs_fyp_2024/services/upload_image_api.dart';
import 'package:universal_io/io.dart';
// import 'dart:io';

// import 'package:image_picker_web/image_picker_web.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_web/image_picker_web.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:srs_fyp_2024/app/app.router.dart';

class RegisterScreenVM extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  String logo = 'assets/logo/Logo.png';
  String image = 'assets/logo/Register_Screen.jpg';
  SnackbarService snackBarService = SnackbarService();
  NavigationService navigationService = NavigationService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController rollNumberController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController resNoController = TextEditingController();

  final storageRef = FirebaseStorage.instance.ref();
  File? pickedFile;
  var file;
  Uint8List webImage = Uint8List(8);
  final pickedImage = <Image>[];
  bool picked = false;
  File? info;
  String imageInfo = '';
  String role = '';
  int index = 0;

  setRole(string) {
    role = string;
    notifyListeners();
  }

  String? profilePhotoUrl = '';
  saveImage(uid, PickedFile) async {
    // var storage = firebase.app().storage("gs://my-custom-bucket");
    // UploadTask uploadTask = storageRef
    //     .child('images/profile/${uid}.jpg')
    //     .putFile(pickedFile!, SettableMetadata(contentType: 'image/jpeg'));
    // log('Done');
    // notifyListeners();
    // String? pId = const Uuid().v4();
    Reference reference =
        FirebaseStorage.instance.ref().child('Items/profile/$uid.jpg');
    await reference.putData(
      await pickedFile!.readAsBytes(),
      SettableMetadata(contentType: 'image/jpeg'),
    );
    String value = await reference.getDownloadURL();
    log(value);
    profilePhotoUrl = value;
  }

  final downloadRef = FirebaseStorage.instance;

  Future<void> getUrl(uid) async {
    final profile = downloadRef.ref().child("images/profile/${uid}.jpg");

    profilePhotoUrl = await profile.getDownloadURL();
    print('downloaded');

    notifyListeners();
  }

  Future<void> imagePickerWeb() async {
    final ImagePicker picker = ImagePicker();
    // final ImagePickerWeb pickerWeb = ImagePickerWeb();
    final image = await picker.pickImage(source: ImageSource.gallery);
    // Future<void> _getImgFile() async {
    // final infos = await ImagePickerWeb.getImageAsFile();

    //   setState(
    //     () => _imageInfo =
    //         'Name: ${infos?.name}\nRelative Path: ${infos?.webkitRelativePath}',
    //   );
    // }
    if (image != null) {
      pickedFile = File(image.path);
      print('Picked');

      await saveImage(rollNumberController.text, picked);
      // await getUrl(rollNumberController.text);
      picked = true;
      log(profilePhotoUrl!);
    } else {
      debugPrint('No Image Picked');
    }
  }

  String isImageUploaded = "";
  bool isImage = false;

  uploadApiImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    Uint8List bytes = await image!.readAsBytes();

    await UploadApiImage().uploadImage(bytes, image.name).then((value) {
      isImageUploaded = value['location'].toString();
      print("Updated Successfully with link ${value.toString()}");
      print("Location: $isImageUploaded");
    }).onError((error, stackTrace) {
      print(error.toString());
    });
    isImage = true;
    notifyListeners();
  }

  bool obscureText = true;

  void toggleObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  clear() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    rollNumberController.clear();
    classController.clear();
    notifyListeners();
  }

  registerUser() async {
    setBusy(true);
    if (kIsWeb) {
      // Some web specific code there
      try {
        // ignore: unused_local_variable
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        await Future.delayed(
          const Duration(milliseconds: 100),
        );
        if (role == 'Student') {
          await addStudent(credential.user!.uid);
        } else {
          await addTeacher(credential.user!.uid);
        }
        setBusy(false);
        clear();
        snackBarService.showSnackbar(
          message: 'Account created successfully',
          title: 'Success',
          duration: const Duration(seconds: 1),
        );
        navigationService.replaceWithLoginScreen();
      } on FirebaseAuthException catch (e) {
        setBusy(false);
        if (e.code == 'weak-password') {
          snackBarService.showSnackbar(
            message: 'The password provided is too weak.',
            title: 'Error',
            duration: const Duration(seconds: 1),
          );
          log('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          snackBarService.showSnackbar(
            message: 'The account already exists for that email.',
            title: 'Error',
            duration: const Duration(seconds: 1),
          );
          log('The account already exists for that email.');
        }
        log(e.code);
      } catch (e) {
        setBusy(false);
        log(e.toString());
      }
      // print('Web');
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {}
  }
  // }

  CollectionReference student =
      FirebaseFirestore.instance.collection('schoolStudents');

  CollectionReference teacher =
      FirebaseFirestore.instance.collection('schoolTeachers');

  Future<void> addStudent(uid) async {
    // await saveImage(uid);
    // await getUrl(uid);

    // final user = FirebaseAuth.instance.currentUser;
    log('inside');
    log(isImageUploaded);
    // Call the user's CollectionReference to add a new user
    return student
        .doc(uid)
        .set(
          {
            'email': emailController.text,
            'name': nameController.text,
            'rollNum': rollNumberController.text,
            'class': classController.text,
            'role': role,
            'imageUrl': isImageUploaded.toString(),
          },
        )
        .then(
          (value) => log("Student Added"),
        )
        .catchError(
          (error) {
            log(error.toString());
            snackBarService.showSnackbar(
              message: error.toString(),
              title: 'Error',
              duration: const Duration(seconds: 2),
            );
          },
        );
  }

  Future<void> addTeacher(uid) async {
    // await saveImage(uid);
    // await getUrl(uid);

    // final user = FirebaseAuth.instance.currentUser;
    log('inside');
    log(isImageUploaded);

    // Call the user's CollectionReference to add a new user
    return student
        .doc(uid)
        .set(
          {
            'email': emailController.text,
            'name': nameController.text,
            'desingation': designationController.text,
            'resNo': resNoController.text,
            'role': role,
            'imageUrl': isImageUploaded.toString(),
          },
        )
        .then(
          (value) => log("Teacher Added"),
        )
        .catchError(
          (error) {
            log(error.toString());
            snackBarService.showSnackbar(
              message: error.toString(),
              title: 'Error',
              duration: const Duration(seconds: 2),
            );
          },
        );
  }
}
