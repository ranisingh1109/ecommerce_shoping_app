import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileController extends GetxController {
  var imageUrl = ''.obs;
  var name = ''.obs;
  var phoneNumber = ''.obs;
  var address = ''.obs;

  void updateProfile(String newName, String newPhone, String newImageUrl ,String newAddress) {
    name.value = newName;
    phoneNumber.value = newPhone;
    imageUrl.value = newImageUrl;
    address.value = newAddress;
  }
}