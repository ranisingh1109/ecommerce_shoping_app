import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../controller/favorites/favorites_controller.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  ProductDetailScreen({required this.product, required this.productIndex});

  @override
  Widget build(BuildContext context) {
    final FavoritesController3 favoritesController =
        Get.find<FavoritesController3>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        backgroundColor: Colors.indigo[900],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Image.network(
                      product['image'],
                      height: 370,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Favorite button (Like/Unlike)
                  Column(
                    children: [
                      const SizedBox(height: 30),
                      Obx(() {
                        return CircleAvatar(
                          child: IconButton(
                            onPressed: () {
                              favoritesController.toggleFavorite(
                                  productIndex); // Toggle using index
                              Fluttertoast.showToast(
                                msg:
                                    favoritesController.isFavorite(productIndex)
                                        ? "Added to Favorites!"
                                        : "Removed from Favorites!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor:
                                    favoritesController.isFavorite(productIndex)
                                        ? Colors.green
                                        : Colors.red,
                                textColor: Colors.white,
                              );
                            },
                            icon: Icon(
                              favoritesController.isFavorite(productIndex)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color:
                                  favoritesController.isFavorite(productIndex)
                                      ? Colors.red
                                      : Colors.black,
                              size: 25,
                            ),
                          ),
                        );
                      }),
                       SizedBox(
                         height: 50,
                       ),
                      CircleAvatar(child: IconButton(onPressed: (){}, icon: Icon(Icons.share)),)
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                product['title'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '\$${product['price']}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Product Description:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                product['description'] ?? 'No description available.',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
