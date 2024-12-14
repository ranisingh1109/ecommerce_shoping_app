import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

class ShareController extends GetxController {
  var productName = ''.obs;
  var productPrice = ''.obs;
  var productImageUrl = ''.obs;
  final FirebaseDynamicLinks _firebaseDynamicLinks = FirebaseDynamicLinks.instance;
  Future<void> createDynamicLink(String productId) async {
    var parameters = DynamicLinkParameters(
      link: Uri.parse("https://firebaefirestoreproject.page.link/product?productId=$productId"),
      uriPrefix: "https://firebaefirestoreproject.page.link",
      androidParameters: const AndroidParameters(
        packageName: "com.example.firebae_firestore_project",
        minimumVersion: 1,
      ),
    );

    try {
      final dynamicLink = await _firebaseDynamicLinks.buildLink(parameters);
      _shareDynamicLink(dynamicLink.toString());
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to create dynamic link: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
  void _shareDynamicLink(String link) {
    Share.share("Check out this product: $link");
    Fluttertoast.showToast(
      msg: "Sharing product link...",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }
  void shareProduct() {
    String productId = productName.value;
    createDynamicLink(productId);
  }
}
