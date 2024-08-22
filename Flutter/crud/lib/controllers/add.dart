import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/models/user.dart';
import 'package:flutter/material.dart';

final controllerName = TextEditingController();
final controllerAge = TextEditingController();
final controllerDate = TextEditingController();

Future createUser(User user) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();
  user.id = docUser.id;
  final json = user.toJson();

  //Create document and write data to Firebase
  await docUser.set(json);
}
