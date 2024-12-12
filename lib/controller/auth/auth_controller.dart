import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Rx<File?> profileImage = Rx<File?>(null);
  RxMap<String, dynamic> userData = RxMap<String, dynamic>({});
  RxBool isLoading = false.obs;
  Future<void> pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profileImage.value = File(pickedImage.path);
    }
  }
  Future<void> registerUser({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    if (profileImage.value == null) {
      Fluttertoast.showToast(msg: "Please upload an image", backgroundColor: Colors.red);
      return;
    }

    try {
      isLoading.value = true;

      // 1. Register the user
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String fileName = '${userCredential.user!.uid}_profileImage';
      Reference ref = _storage.ref().child('user_profiles/$fileName');
      await ref.putFile(profileImage.value!);
      String imageUrl = await ref.getDownloadURL();
      await _firestore.collection('e_commerce').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'name': name,
        'email': email,
        'phone': phone,
        'imageUrl': imageUrl,
      });

      Fluttertoast.showToast(msg: "Registration Successful!", backgroundColor: Colors.green);
      Get.offAllNamed('/home');
    } catch (e) {
      Fluttertoast.showToast(msg: "Error: $e", backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> fetchUserData() async {
    final userId = _auth.currentUser?.uid;
    if (userId != null) {
      DocumentSnapshot snapshot = await _firestore.collection('e_commerce').doc(userId).get();
      if (snapshot.exists) {
        userData.value = snapshot.data() as Map<String, dynamic>;
        print("User Data: ${userData.value}");
      } else {
        print("No user data found!");
      }
    } else {
      print("User ID is null!");
    }
  }


  Future<void> logout() async {
    await _auth.signOut();
    Get.offAllNamed('/login');
  }
}
