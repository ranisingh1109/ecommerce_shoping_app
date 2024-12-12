import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/auth/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  final AuthController controller = Get.find();

  ProfileScreen({Key? key})  : super(key: key) {
    controller.fetchUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("My profile"),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: Obx(() {
        if (controller.userData.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Section
            ListTile(
              leading: CircleAvatar(
                backgroundImage: controller.userData['imageUrl'] != null
                    ? NetworkImage(controller.userData['imageUrl'])
                    : const AssetImage('assets/placeholder.png') as ImageProvider,
                radius: 30,
              ),

              title: Text(
                "Name: ${controller.userData['name']},",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Email: ${controller.userData['email']}",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            const Divider(),
            // Options List
            buildProfileOption(
                Icons.shopping_bag, "My orders", "Already have 12 orders"),
            buildProfileOption(
                Icons.location_on, "Shipping addresses", "3 addresses"),
            buildProfileOption(Icons.payment, "Payment methods", "Visa **34"),
            buildProfileOption(
                Icons.discount, "Promocodes", "You have special promocodes"),
            buildProfileOption(
                Icons.reviews, "My reviews", "Reviews for 4 items"),
            buildProfileOption(
                Icons.settings, "Settings", "Notifications, password"),
          ],
        );
      }),
    );
  }

  Widget buildProfileOption(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.red),
      title: Text(title),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      onTap: () {},
    );
  }
}
