import 'package:flutter/material.dart';
import 'package:hello_new/tools/app_method.dart';
import 'package:hello_new/tools/app_tools.dart';
import 'package:hello_new/tools/app_data.dart';
import 'package:hello_new/tools/firebase_methods.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';
import 'dart:io';

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  TextEditingController productTitleController = new TextEditingController();
  TextEditingController productPriceController = new TextEditingController();

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        appBar: new AppBar(
          actions: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(right: 12.0, top: 10.0, bottom: 10.0),
              child: RaisedButton.icon(
                onPressed: getImage,
                color: Colors.green[700],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: Text(
                  "Images",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
          elevation: 0.0,
          title: new Text(
            "App Products",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 18.0,
              ),
              MultiImagePickerList(
                  imageList: imageList,
                  removeNewImage: (index) {
                    removeImage(index);
                  }),
              new SizedBox(
                height: 10.0,
              ),
              new SizedBox(
                height: 10.0,
              ),
              new SizedBox(
                height: 10.0,
              ),
              productTextField(
                  textTitle: "Product Title",
                  textHint: "Enter Product Title",
                  controller: productTitleController),
              new SizedBox(
                height: 10.0,
              ),
              productTextField(
                  textTitle: "Product Price",
                  textHint: "Enter Product Price",
                  textType: TextInputType.number,
                  controller: productPriceController),
              new SizedBox(
                height: 10.0,
              ),
              appButton(
                  btnTxt: "Add Product",
                  onBtnclicked: () => addNewProducts(),
                  btnPadding: 20.0,
                  btnColor: Theme.of(context).primaryColor)
            ],
          ),
        ));
  }

  List<File> imageList;

  Future getImage() async {
    File file = await ImagePicker.pickImage(source: ImageSource.camera);
    if (file != null) {
      //imagesMap[imagesMap.length] = file;
      List<File> imageFile = new List();
      imageFile.add(file);
      //imageList = new List.from(imageFile);
      if (imageList == null) {
        imageList = new List.from(imageFile, growable: true);
      } else {
        for (int s = 0; s < imageFile.length; s++) {
          imageList.add(file);
        }
      }
      setState(() {});
    }
  }

  removeImage(int index) async {
    //imagesMap.remove(index);
    imageList.removeAt(index);
    setState(() {});
  }

  AppMethods appMethods = FirebaseMethods();

  addNewProducts() async {
    if (imageList == null || imageList.isEmpty) {
      showSnackBar("Product Images cannot be empty", scaffoldKey);
      return;
    }

    if (productTitleController.text == "") {
      showSnackBar("Product Title Can Not Be Empty", scaffoldKey);
      return;
    }

    if (productPriceController.text == "") {
      showSnackBar("Product Price cannot be empty", scaffoldKey);
      return;
    }

    displayProgressDialog(context);
  //   //get the Text from indivisual C0ntroller Title Price And Description
    Map<String, dynamic> newProduct = {
      productTitle: productTitleController.text,
      productPrice: productPriceController.text,
      productImages: imageList,
    };

  //   String productID = await appMethods.addNewProduct(newProduct: newProduct);

  //   //Now time to Upload to
  //   List<String> imageUrl = await appMethods.uplaodProductImages(
  //       docID: productID, imagesList: imageList);

  //   if (imageUrl.contains(error)) {
  //     closeProgressDialog(context);
  //     showSnackBar("Images uplaod Error, Contact Developer", scaffoldKey);
  //   }
  //   bool result = await appMethods.updateProductImages(
  //     docID: productID,
  //     data: imageUrl,
  //   );
  //   if (result != null && result == true) {
  //     closeProgressDialog(context);
  //     resetEverything();
  //     showSnackBar("Produc Added Successfully", scaffoldKey);
  //   } else {
  //     closeProgressDialog(context);
  //     showSnackBar("An Error Occurred Contact Devloper ", scaffoldKey);
  //   }
  // }

  // void resetEverything() {
  //   productTitleController.text = "";
  //   productPriceController.text = "";
  //   imageList.clear();
  // }
}
}