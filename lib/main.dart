import 'package:e_commerce_app/controller/auth/auth_controller.dart';
import 'package:e_commerce_app/controller/image/image_controller.dart';
import 'package:e_commerce_app/controller/profile/profile_controller.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/view/screen/home/home_screen.dart';
import 'package:e_commerce_app/view/screen/login/login_srceen.dart';
import 'package:e_commerce_app/view/screen/register/register_screen.dart';
import 'package:e_commerce_app/view/screen/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/favorites/favorites_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(FavoritesController());
  Get.put(FavoritesController3());
  Get.put(ProfileController());
  Get.put(AuthController());
  Get.put(FirebaseStorageService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Commerce App",
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/home', page: () => const HomepageScreen()),
      ],
    );
  }
}
