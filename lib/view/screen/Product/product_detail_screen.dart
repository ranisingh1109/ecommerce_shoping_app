import 'package:e_commerce_app/utils/app_color.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['title'],style: TextStyle(color: AppColor.texCilor),),
        backgroundColor: Colors.indigo[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product['image'],
                height: 200,
                fit: BoxFit.cover,
              ),
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
            Spacer(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(bottom: 40),
            //       child: Container(
            //         width: 150,
            //         height: 50,
            //         child: ElevatedButton(
            //           onPressed: () {},
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: Colors.indigo[900],
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             padding: const EdgeInsets.symmetric(
            //                 vertical: 10, horizontal: 20),
            //             textStyle: const TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //               color: Colors.black,
            //             ),
            //           ),
            //           child: const Text(
            //             'Buy Now',
            //             style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //               color: AppColor.texCilor,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(bottom: 40),
            //       child: Container(
            //         width: 150,
            //         height: 50,
            //         child: ElevatedButton(
            //           onPressed: () {},
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: Colors.indigo[900],
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             padding: const EdgeInsets.symmetric(
            //                 vertical: 10, horizontal: 20),
            //             textStyle: const TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //               color: Colors.black,
            //             ),
            //           ),
            //           child: const Text(
            //             'Add to Cart',
            //             style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //               color: AppColor.texCilor,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
