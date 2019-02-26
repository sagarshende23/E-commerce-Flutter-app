import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class AppMethods {
  // Future<String> logginUser({String email, String password});
  // Future<String> createUserAccount(
  //     {String fullname, String phone, String email, String password});
  // Future<bool> logOutUser();

  // Future<DocumentSnapshot> getUserInfo(String userid);
  Future<String> addNewProduct({Map newProduct});
  // Future<List<String>> uplaodProductImages(
  //     {List<File> imagesList, String docID});

  Future<bool> updateProductImages({
    String docID,
    List<String> data,
  });
}
