import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/splash/splash_controller.dart';
import '../../../utils/app_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 340),
            child: Center(
              child: Image.asset(
                "assets/image/transparent-png.png",
                width: 200,
                height: 170,
                // color: AppColor.imageCilor,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 260),
            child: Text(
              "Please Wait....",
              style: TextStyle(color: AppColor.textColor,fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
