import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Import RatingBar
import '../../../controller/favorites/favorites_controller.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  const ProductDetailScreen({required this.product, required this.productIndex});

  @override
  Widget build(BuildContext context) {
    final FavoritesController3 favoritesController = Get.find<FavoritesController3>();
    double userRating = 3.5;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image and Favorite/Share Buttons
              Row(
                children: [
                  Expanded(
                    child: Image.network(
                      product['image'],
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      const SizedBox(height: 30),
                      Obx(() {
                        return
                          CircleAvatar(
                          child: IconButton(
                            onPressed: () {
                              favoritesController.toggleFavorite(productIndex);
                              Fluttertoast.showToast(
                                msg: favoritesController.isFavorite(productIndex)
                                    ? "Added to Favorites!"
                                    : "Removed from Favorites!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: favoritesController.isFavorite(productIndex)
                                    ? Colors.green
                                    : Colors.red,
                                textColor: Colors.white,
                              );
                            },
                            icon: Icon(
                              favoritesController.isFavorite(productIndex)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: favoritesController.isFavorite(productIndex)
                                  ? Colors.red
                                  : Colors.black,
                              size: 25,
                            ),
                          ),
                        );
                      }),
                      const SizedBox(height: 50),
                      CircleAvatar(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share),
                        ),
                      ),
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
              const SizedBox(height: 0),
              Text(
                '\$${product['price']}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
              RatingBar.builder(
                initialRating: userRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 25, // Adjust star size
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.redAccent,
                ),
                onRatingUpdate: (rating) {
                },
              ),
              const SizedBox(height: 5),
              const Text(
                'Product Description:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                product['description'] ?? 'No description available.',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
