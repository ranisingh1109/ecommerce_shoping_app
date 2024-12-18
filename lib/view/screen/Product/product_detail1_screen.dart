import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../controller/share/share_controller.dart';
import '../../../controller/favorites/favorites_controller.dart';

class ProductDetailScreen1 extends StatelessWidget {
  final String productId;
  final String imageUrl;
  final String labelText;
  final String price;
  final String description;

  const ProductDetailScreen1({
    Key? key,
    required this.productId,
    required this.imageUrl,
    required this.labelText,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ShareController shareController = Get.put(ShareController());
    final FavoritesController3 favoritesController =
        Get.find<FavoritesController3>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {
              shareController.createDynamicLink(labelText);
              Fluttertoast.showToast(msg: "Sharing product...");
            },
          ),
        ],
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
                      imageUrl,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                labelText,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '\$$price',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              RatingBar.builder(
                initialRating: 4.0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 25,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.redAccent,
                ),
                onRatingUpdate: (rating) {},
              ),
              const SizedBox(height: 10),
              const Text(
                'Product Description:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "the activity of buying things from shops: "
                "I'm going shopping this afternoon. "
                "My granddaughter does my weekly shopping for me. "
                "UK The store is open for late night shopping on Wednesdays",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
                label: const Text("Add to Cart"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                ),
                label: const Text("Add to Favorites"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Buy Now Button
          ],
        ),
      ),
    );
  }
}
