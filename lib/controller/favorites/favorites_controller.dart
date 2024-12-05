import 'package:get/get.dart';

import '../../model/model.dart';

class FavoritesController extends GetxController {
  final RxList<int> favorites = <int>[].obs;
  bool isFavorite(int index) => favorites.contains(index);
  void toggleFavorite(int index) {
    if (favorites.contains(index)) {
      favorites.remove(index);
    } else {
      favorites.add(index);
    }
  }
}



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
