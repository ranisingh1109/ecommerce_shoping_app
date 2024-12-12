import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/auth_controller.dart';
import '../../../utils/app_color.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController controller = Get.find();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Register",
            style: TextStyle(color: AppColor.texCilor),
          ),
          backgroundColor: Colors.indigo[900]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => controller.pickImage(),
              child: Obx(() => CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey,
                    backgroundImage: controller.profileImage.value != null
                        ? FileImage(controller.profileImage.value!)
                        : null,
                    child: controller.profileImage.value == null
                        ? const Icon(Icons.person,
                            size: 60, color: Colors.white)
                        : null,
                  )),
            ),
            const SizedBox(height: 20),
            buildTextField(
              "Name",
              nameController,
              Icons.person,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your name";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            buildTextField(
              "Email",
              emailController,
              Icons.email,
              validator: (value) {
                if (value == null || !value.contains('@')) {
                  return "Please enter a valid email";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            buildTextField(
              "Phone",
              phoneController,
              Icons.phone,
              keyboardType: TextInputType.number,
              maxLength: 10,
              validator: (value) {
                if (value == null || value.length != 10) {
                  return "Please enter a 10-digit phone number";
                }
                return null;
              },
            ),

            const SizedBox(height: 20),
            buildTextField(
              "Password",
              passwordController,
              Icons.lock,
              maxLength: 6,
              isPassword: true,
              validator: (value) {
                if (value == null || value.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.registerUser(
                          name: nameController.text.trim(),
                          email: emailController.text.trim(),
                          phone: phoneController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo[900],
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text("Register Now",
                          style: TextStyle(color: Colors.white)),
                    ),
                  )),
            SizedBox(height: 20),
            Text.rich(
              TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(color: Colors.black, fontSize: 20),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed('/login');
                      },
                    text: 'Login',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildTextField(
    String hintText,
    TextEditingController controller,
    IconData icon, {
    bool obscureText = false,
    FormFieldValidator<String>? validator,
    Widget? suffixIcon,
    int? maxLength,
    bool isPassword = false,
    TextInputType? keyboardType,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.red),
          suffixIcon: suffixIcon,
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          counterText: "",
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        ),
        maxLength: maxLength,
        validator: validator,
        keyboardType: keyboardType,
      ),
    );
  }
}
