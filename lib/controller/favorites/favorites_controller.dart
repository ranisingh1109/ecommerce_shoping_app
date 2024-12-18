import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
class FavoritesController3 extends GetxController {
  List<int> favorites = [];

  void toggleFavorite(int productId) {
    if (favorites.contains(productId)) {
      favorites.remove(productId);
    } else {
      favorites.add(productId);
    }
    update();
  }
}

