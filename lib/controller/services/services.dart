import 'dart:convert';

import 'package:http/http.dart'as  http;
// class ServicesApi{
//   var   besUrl = 'https://fakestoreapi.com/products';
//   Future<List<Product>>  fetchProductsii()async {
//  var   response = await  http.get(Uri.parse(besUrl));
//   if(response.statusCode == 200){
//     List<dynamic> data = json.decode(response.body); // Decode the response body
//     return data.map((json) => Product.fromJson(json)).toList();
//   }
//   else{
//     throw Exception('Failed to load products');
//   }
//   }
//
// }
class ProductService {
  final String baseUrl = "https://api.escuelajs.co/api/v1/products";
  Future<List<dynamic>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> products = jsonDecode(response.body);
        return products;
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}