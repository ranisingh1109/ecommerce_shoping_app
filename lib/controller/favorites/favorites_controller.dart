import 'package:get/get.dart';

import '../../model/model.dart';
class FavoritesController3 extends GetxController {
  var favorites = <int>[].obs;
  void toggleFavorite(int index) {
    if (favorites.contains(index)) {
      favorites.remove(index);
    } else {
      favorites.add(index);
    }
  }
  bool isFavorite(int index) {
    return favorites.contains(index);
  }
}
