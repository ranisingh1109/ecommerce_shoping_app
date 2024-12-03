import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../model/model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var products = [].obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();

  }

  void fetchProducts() async {
    try {
      isLoading(true);
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        products.value = jsonDecode(response.body);
      } else {
        Get.snackbar("Error", "Failed to load products");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

}

// class RecipeController extends GetxController {
//   var recipes = <dynamic>[].obs;
//   var isLoading = true.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchRecipes();
//   }
//
//   Future<void> fetchRecipes() async {
//     try {
//       isLoading(true);
//       final response =
//           await http.get(Uri.parse('https://picsum.photos/v2/list'));
//       if (response.statusCode == 200) {
//         var jsonData = json.decode(response.body);
//         print('Fetched Data: $jsonData');
//         recipes.value = jsonData;
//         print('Fetched Recipes: $recipes');
//       } else {
//         throw Exception('Failed to load recipes');
//       }
//     } catch (e) {
//       print('Error: $e');
//     } finally {
//       isLoading(false);
//     }
//   }
// }

