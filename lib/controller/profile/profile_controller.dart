import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileController extends GetxController {
  var name = ''.obs;
  var emailN = ''.obs;
  var imageUrl = ''.obs;

  void updateProfile(String newName, String newEmail, String newImageUrl) {
    name.value = newName;
    emailN.value = newEmail;
    imageUrl.value = newImageUrl;
    print("Updated Name: $newName");
    print("Updated Email: $newEmail");
    print("Updated Image URL: $newImageUrl");
  }
  void fetchUserData() {
    name.value = "John Doe";
    emailN.value = "john.doe@example.com";
    imageUrl.value = "path/to/your/image.jpg";
  }
}