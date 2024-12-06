import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';

class AFeedbackVM extends BaseViewModel {
  CollectionReference feedback =
      FirebaseFirestore.instance.collection('feedback');
}
