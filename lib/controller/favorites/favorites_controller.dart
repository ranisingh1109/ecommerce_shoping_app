import 'package:get/get.dart';

class FavoritesController extends GetxController {
  final RxList<int> _favorites = <int>[].obs;
  bool isFavorite(int index) => _favorites.contains(index);
  void toggleFavorite(int index) {
    if (_favorites.contains(index)) {
      _favorites.remove(index);
    } else {
      _favorites.add(index);
    }
  }

  // Get the list of favorited item indices
  List<int> get favorites => _favorites;
}
