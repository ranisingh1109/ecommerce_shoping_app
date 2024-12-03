import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  void checkLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Get.offNamed('/home');
    } else {
      Get.offNamed('/login');
    }
  }
}