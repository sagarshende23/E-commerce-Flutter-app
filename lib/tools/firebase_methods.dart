import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_new/tools/app_data.dart';
import 'package:hello_new/tools/app_method.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'app_data.dart';

import 'package:flutter/services.dart';
import 'dart:core';
import 'dart:io';

class FirebaseMethods implements AppMethods {
  Firestore firestore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<String> addNewProduct({Map newProduct}) async {
    // TODO: implement addNewProduct

    String documentsID;
    await firestore
        .collection(appProducts)
        .add(newProduct)
        .then((documentsRef) {
      documentsID = documentsRef.documentID;
    });
    return documentsID;
  }


  @override
  Future<bool> updateProductImages({String docID, List<String> data}) async {
    // TODO: implement updateProductImages
    bool msg;
    await firestore
        .collection(appProducts) 
        .document(docID)
        .updateData({productImages: data}).whenComplete(() {
      msg = true;
    });
    return msg;
  }

//   @override
//   Future<List<String>> uplaodProductImages({List<File> imagesList, String docID}) async{
//     // TODO: implement uplaodProductImages
//     List<String> imageUrl = List();
//     try {
//       for (int s = 0; s < imagesList.length; s++) {
//         StorageReference storageReference = FirebaseStorage.instance
//             .ref()
//             .child(appProducts)
//             .child(docID)
//             .child(docID + "Ss.jpg");
//         StorageUploadTask uploadTask = StorageReference.putFile(imagesList[s]);
//         Uri downloadUrl = (await uploadTask.future).downloadUrl;
//         imageUrl.add(downloadUrl.toString());
//       }
//     } on PlatformException catch (e) {
//       imageUrl.add(error);
//       print(e.details);
//     }
//     return null;
//   }
}
