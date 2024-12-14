import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/controller/share/share_controller.dart';

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
    double userRating = 3.5;
    final ShareController controller = Get.put(ShareController());
    controller.productName.value = labelText;
    controller.productPrice.value = price;
    controller.productImageUrl.value = imageUrl;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          labelText,
          style: const TextStyle(color: Colors.white),
        ),
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
                  height: 290,
                  fit: BoxFit.cover,
                ),
                // Positioned Icons
                Positioned(
                  top: 30,
                  right: 10,
                  child: Column(
                    children: [
                      // Favorite Button
                      CircleAvatar(
                        child: IconButton(
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
                      const SizedBox(height: 100),
                      // Share Button
                      CircleAvatar(
                        child: IconButton(
                          onPressed: () {
                            controller.shareProduct();
                          },
                          icon: const Icon(
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
                  // Product Title
                  Text(
                    labelText,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Product Price
                  Text(
                    'Price: $price',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Product Rating
                  RatingBar.builder(
                    initialRating: userRating,
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
                    onRatingUpdate: (rating) {
                      Fluttertoast.showToast(
                        msg: "You rated: $rating",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  // Product Description
                  const Text(
                    'Description:',
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
