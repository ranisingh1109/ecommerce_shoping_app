import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../controller/favorites/favorites_controller.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../controller/favorites/favorites_controller.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;
  final VoidCallback onAddToCart;

  const ProductCard({
    required this.product,
    required this.onTap,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final FavoritesController3 favoritesController = Get.find<FavoritesController3>();

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Stack(
              children: [
                Image.network(
                  product['image'],
                  width: 170,
                  height: 100,
                  fit: BoxFit.cover,
                ),

              ],
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              product['title'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
          Text(
            '\$${product['price']}',
            style: const TextStyle(color: Colors.green),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: onAddToCart,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailScreen1 extends StatelessWidget {
  final String imageUrl;
  final String labelText;
  final String price;

  const ProductDetailScreen1({
    Key? key,
    required this.imageUrl,
    required this.labelText,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(labelText),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Product Image
                Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                // Positioned Icons
                Positioned(
                  top: 30,
                  right: 10,
                  child: Column(
                    children: [
                     CircleAvatar(
                       child:  IconButton(
                         onPressed: () {
                           Fluttertoast.showToast(
                             msg: "Added to Favorites!",
                             toastLength: Toast.LENGTH_SHORT,
                             gravity: ToastGravity.BOTTOM,
                             backgroundColor: Colors.green,
                             textColor: Colors.white,
                           );
                         },
                         icon: const Icon(
                           Icons.favorite_border,
                           color: Colors.black,
                           size: 25,
                         ),
                       ),
                     ),
                      // Share Icon
                      SizedBox(height: 100,),
                      CircleAvatar(
                        child: IconButton(
                          onPressed: () {
                            Fluttertoast.showToast(
                              msg: "Sharing the product!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.blue,
                              textColor: Colors.white,
                            );
                          },
                          icon: Icon(
                            Icons.share,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    labelText,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Price: $price',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'This is a detailed description of the product. Add your content here.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


