import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }
  void checkLogin() async {
    await Future.delayed(Duration(seconds: 2));
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColor.backgroundColorSp ,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 340),
            child: Center(child: Image.asset("assets/image/meesho.png",width: 170,height: 170,color: AppColor.imageCilor,)),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 260),
            child: Text("Please Wait....",style: TextStyle(color: AppColor.imageCilor),),
          )
        ],
      ),
    );
  }
}