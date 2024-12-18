import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/favorites/favorites_controller.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Map<String, dynamic>> allProducts;

  const FavoriteScreen({Key? key, required this.allProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavoritesController3 favoritesController = Get.find<FavoritesController3>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: Colors.redAccent,
      ),
      body: GetBuilder<FavoritesController3>(
        builder: (controller) {
          // Filter liked products using product ID
          List<Map<String, dynamic>> likedProducts = allProducts
              .where((product) => controller.favorites.contains(product['id'].hashCode))
              .toList();

          if (likedProducts.isEmpty) {
            return const Center(
              child: Text(
                "No favorite products yet!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            );
          }
          return ListView.builder(
            itemCount: likedProducts.length,
            itemBuilder: (context, index) {
              final product = likedProducts[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.network(
                    product['image'],
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product['title']),
                  subtitle: Text("\$${product['price']}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      controller.toggleFavorite(product['id'].hashCode);
                      Get.snackbar(
                        "Removed",
                        "${product['title']} removed from favorites",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white,
                      );
                      controller.update(); // Update the state
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
