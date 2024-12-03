import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs;

  void addToCart(Map<String, dynamic> item) {
    cartItems.add(item);
    update();
    print("Added to cart: ${item['title']}");
  }

  void removeFromCart(Map<String, dynamic> item) {
    cartItems.remove(item);
    update();
    print("Removed from cart: ${item['title']}");
  }

  void clearCart() {
    cartItems.clear();
    update();
  }

  int get cartCount => cartItems.length;
}



// Obx(() {
//   if (recipeController.isLoading.value) {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 8,
//         childAspectRatio: 0.7,
//       ),
//       itemCount: 6,
//       itemBuilder: (context, index) {
//         return Shimmer.fromColors(
//           baseColor: Colors.grey[300]!,
//           highlightColor: Colors.grey[100]!,
//           child: Container(
//             color: Colors.white,
//             child: Column(
//               children: [
//                 Container(
//                     width: 50, height: 50, color: Colors.grey),
//                 const SizedBox(height: 10),
//                 Container(height: 20, color: Colors.grey),
//                 Container(
//                     height: 20, width: 100, color: Colors.grey),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   if (recipeController.recipes.isEmpty) {
//     return Center(child: Text('No recipes found'));
//   }
//
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: GridView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 8,
//         childAspectRatio: 0.7,
//       ),
//       itemCount: recipeController.recipes.length,
//       itemBuilder: (context, index) {
//         var recipe = recipeController.recipes[index];
//         var imageUrl = recipe['download_url'] ?? '';
//         var author = recipe['author'] ?? 'Unknown Author';
//         return Card(
//           elevation: 5,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             children: [
//               imageUrl.isNotEmpty
//                   ? Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: Image.network(
//                         imageUrl,
//                         width: 180,
//                         height: 150,
//                         fit: BoxFit.cover,
//                       ),
//                     )
//                   : SizedBox(width: 80, height: 80),
//               SizedBox(height: 10),
//               Text(
//                 author,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     cartController.addToCart(recipe);
//                     Fluttertoast.showToast(
//                       msg: "Added to Cart",
//                       toastLength: Toast.LENGTH_SHORT,
//                       gravity: ToastGravity.BOTTOM,
//                       timeInSecForIosWeb: 1,
//                       backgroundColor: Colors.black,
//                       textColor: Colors.white,
//                       fontSize: 16.0,
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColor.backgroundColorSp,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: const Text(
//                     'Add to Cart',
//                     style: TextStyle(color: AppColor.texCilor),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     ),
//   );
// }),