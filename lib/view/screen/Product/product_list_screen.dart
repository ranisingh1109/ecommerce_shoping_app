import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/view/screen/Product/product_detail1_screen.dart';
import 'package:e_commerce_app/view/screen/Product/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../controller/auth/auth_controller.dart';
import '../../../controller/favorites/favorites_controller.dart';
import '../../../controller/image/image_controller.dart';
import '../../../controller/product/cart_controller.dart';
import '../../../controller/product/product_controller.dart';
import '../card/card_screen.dart';

class ProductListScreen extends StatefulWidget {
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());
  final List<Map<String, String>> products = [
    {
      "imageUrl":
          "https://www.graphixking.com/wp-content/uploads/2020/09/Girl-T-Shirt-Heart-Glitter-Print.jpg",
      "labelText": "T-Shirt Design",
      "price": "12\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9U1-0bvJhWHx8-aCsvrCjIo6DE-NF6Psp8TNgDu_5HMDJ-3SVEi3r-DTR9FeGcoc0LLk&usqp=CAU",
      "labelText": "Casual Shirt",
      "price": "432\$",
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbRRDwT0mlmKm-61CYS74wsKiE0qVef35c0Vwh0joT5tFJkyF1cqgqoJPg-9zkkl6qrtM&usqp=CAU",
      "labelText": "Summer Tee",
      "price": "122\$",
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLSlq0FtpQYkn_gzszEdyARzbV46MFsdngoKx4O5Jk-2eEo4roDCDI5M6CHyCKWA_2MfM&usqp=CAU",
      "labelText": "Formal Wear",
      "price": "12\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ09jeWJmsp3c0-hQH8b4Za1wDWssXpc_FL6Q&s",
      "labelText": "Graphic Tee",
      "price": "123\$",
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGfVvxErPi4xtNYYI9I6CEqXIn3QWQHxhs2g&s",
      "labelText": "T-Shirt Design",
      "price": "132\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtek690E-LEvhGWRSo4Xhfkw01V-7U8mSTyA&s",
      "labelText": "Graphic Tee 2",
      "price": "192\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ09jeWJmsp3c0-hQH8b4Za1wDWssXpc_FL6Q&s",
      "labelText": "Graphic Tee 3",
      "price": "182\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8j5ePJ_ugrqGI54b-0RPh377WPL2gh_hHvendIyTZ4QZ9WwrPDQG1tJ0YIUpAYyIWKUA&usqp=CAU",
      "labelText": "Fashion Top",
      "price": "192\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNhjdv63Bzj9rtKaTOTu2omQCct1UW1ddBO20TfzPP-abw1fdgqjkuged0vMAdBLzJRBs&usqp=CAU",
      "labelText": "Casual Tee",
      "price": "102\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEujgQWkKXacWGrlIEvZAcPb8XliBtvdmKIVwQl7BE7r2gaMeHh1qAdPDNrebnt3qQ1jo&usqp=CAU",
      "labelText": "Trendy Shirt",
      "price": "142\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEujgQWkKXacWGrlIEvZAcPb8XliBtvdmKIVwQl7BE7r2gaMeHh1qAdPDNrebnt3qQ1jo&usqp=CAU",
      "labelText": "T-Shirt Design",
      "price": "12\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEVKlrGuYBU3wEkVG3s1eJcqVnmepCQO_gxCn2idbp4ohU2fIo6GfV9W7nMEzlARTwHHo&usqp=CAU",
      "labelText": "Cool Tee",
      "price": "125\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ98KDlcf_E4L-DiD3_dCxERnvwtC3fWHSwcucxTzYu9G4tdPM8UxL8giJsYB6BhY8tHQk&usqp=CAU",
      "labelText": "Modern Wear",
      "price": "152\$"
    },
    // sari
    {
      "imageUrl":
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcThxWqFa3Fw_DXi04mjvpA3sSLB6LoqwoYv7Q6oG5JgLrjM_RGNYpqOg7sd9vsy8fT_vc7DSYiqzy9h4lVbDAXIo_lgARQnxWgN28fhz_s&usqp=CAE",
      "labelText": "Solid Rayon Kurti",
      "price": "546\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTptK864j_F3nL8wQ1E4u3zsod8tqmE1IYWFojIp656Rq_Afm63B3_Cnxz9HdtMlbMXKiC4S-vpzfYbPRr5j68S72xLuxzMAWcZvBnnuhI8JFrfXob_C-q7&usqp=CAE",
      "labelText": "Casual See",
      "price": "1552\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQRawHhQFOqjHfgrEsGI8hvh3dIujoV5tsCOp7O-MOZhw_W2wezW7l4uzAw7FkAl5GvTE6c20azwbTRHUJ-MQu9ivnaD0ad1XkZfAy__08&usqp=CAE",
      "labelText": "Summer Tee",
      "price": "122\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTWEia5HZMahOHCDzlckE0C38Rqhb_iYiIHouiFC9BoOkGEuepHI6hQ5FdRtI0tTi1O__izqbi_slgRK2GeXiVEnZM6ZO6T5DKXQCRYPiNE&usqp=CAE",
      "labelText": "Formal Wear",
      "price": "156\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg8jQ1xPecglzfheCuodt8E8BY-Aeb291-7w&s",
      "labelText": "Women Sari",
      "price": "12\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQSPiX0p3RFVbzWDbdXOEIlxbFl1czjujyPn_uD6XQ4Iczi6bAVzmbbaPEWtgcUyEq1sMGBK_cVZK8KOY9JHxH2H22lGIfu_rbBwdCgyp4&usqp=CAE",
      "labelText": "Design",
      "price": "12\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQalDJLnYF-oxu01EwIhfl1CfxIjXz7h4uVUso2birzez7AijzBm5I2YeAg6Atbv0OYk6fm7jnuDrS3Bcl4rKLw1i5scSFgUMPpms8l4wo&usqp=CAE",
      "labelText": "Graphic Tee 2",
      "price": "12\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRN57WKGIEuq7_GPJZy8JBkRkyMxNYfi2QSIxNJS_pZ1o2vycCR05kAXM7tePrFM6KvrKhSvWNa3YOIw5zFk1B0F7KUUsggjgkNPeYAPcOwMfMeoHgnNP1N&usqp=CAE",
      "labelText": " Kurt for Women",
      "price": "12\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRahYUwGADprgeJklFbPYtHEwWwosG8HW9f1YnlFEu0hpmpfyn_amg0LBCp7oxBOwbmu39AXhTSQtbjjpDmI5wxCmqEsGt7zRa7e3iK8JQ&usqp=CAE",
      "labelText": "Fashion Top",
      "price": "12\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTSNNZJTW0VGM-hLiXiBntnrWTMCwgvPhtxiRGlPH4KzDeM8V2xoWPcX5FUqO-p4loIxLRh2TQnC0Z7wICxrVGG0a3o7NpMkJFJlu4xja3aQN2MtgSY1kgENA&usqp=CAE",
      "labelText": "Casual Tee",
      "price": "12\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSLj7PLOWvKn1WLUXytq7jskXzRWBuJRZ-tbRfzvt7ffiqs6dxxZL6kyCRFMazSIaxMFeflq3bNa6MNtdPA9kPUoxz9wkLcXc8wKQCLjpA&usqp=CAE",
      "labelText": "New  Georgette Kurt",
      "price": "12\$"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTWnWMOaW8uE60UpNU_mYNw3Dizo1YEGQhqxjjmR813CMe4U94EXEL3mima-R3zTUFsV8SIsgIZWga5WTBs_-GV6J_7AY8oG7COMq5-PX15XH6eHSEkco_v&usqp=CAE",
      "labelText": "Naiyra Cut",
      "price": "12\$"
    },
  ];
  final List<Map<String, String>> categories =
  [
    {
      "name": "Dresses",
      "image":
          "https://images.meesho.com/images/products/434846730/azccd_1200.jpg"
    },
    {
      "name": "Pants",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQskcBnr-7IlMjf3d3uAgbKV2t6hqZFeqLyCQ&s"
    },
    {
      "name": "Skirts",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-0do1Hq5Dm-Er7bJBwDk6y04KDKjZNX9A4A&s"
    },
    {
      "name": "Shorts",
      "image": "https://m.media-amazon.com/images/I/71RlOgFT-wL._SY695_.jpg"
    },
    {
      "name": "Jackets",
      "image":
          "https://hips.hearstapps.com/hmg-prod/images/launchmetrics-paris-str-f20-146b-66bb88a7cdf57.jpg?crop=0.668xw:1.00xh;0.240xw,0&resize=1120:*"
    },
    {
      "name": "Hoodies",
      "image":
          "https://shoezero.com/cdn/shop/articles/two_hoodies.webp?v=1691590215&width=2048"
    },
    {
      "name": "Shirts",
      "image":
          "https://t4.ftcdn.net/jpg/07/63/26/85/360_F_763268538_sk7wNf87lh0ioZMnAnLBOBlf1unB2RNi.jpg"
    },
    {
      "name": "Polo",
      "image":
          "https://rukminim2.flixcart.com/image/832/832/xif0q/shirt/d/z/n/m-a15068-sheetal-associates-original-imah49y2sfqwafh6.jpeg?q=70&crop=false"
    },
    {
      "name": "T-shirts",
      "image":
          "https://cdn.pixabay.com/photo/2024/04/29/04/21/tshirt-8726716_640.jpg"
    },
    {
      "name": "Tunics",
      "image": "https://m.media-amazon.com/images/I/61ZfwTfyumL._SY879_.jpg"
    },
  ];
  final FirebaseStorageService storageService = FirebaseStorageService();
  final AuthController controller = Get.find();
  late Stream<List<Map<String, String>>> imageUrlsStream;
  int _currentIndex = 0;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    imageUrlsStream = storageService.fetchAllImagesWithDetails();
  }

  final List<String> images = [
    'https://t3.ftcdn.net/jpg/02/41/43/18/360_F_241431868_8DFQpCcmpEPVG0UvopdztOAd4a6Rqsoo.jpg',
    "https://www.shutterstock.com/image-photo/stunning-happy-girl-long-brown-260nw-640144120.jpg",
    "https://media.istockphoto.com/id/1073935306/photo/girls-carrying-shopping-bags.jpg?s=612x612&w=0&k=20&c=JB-TrME32dc0VTnaXVxsbJIExZqR71m-iyVOnG-7puM=",
    'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQVh6-6RoOO2egoZQiuwayLVyGZV6Kug4qsOzCniE3y923mfxP1vIiC4Xt99o3IkK5MELQQ1dnT8tqKkGag-RA9s3StdfH9vFnlX38QK3KgjX1epqb61L-Law&usqp=CAE',
    "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcT14z1jYSnhQRWqYBm8DpBd-QBV4WWGHLZKAq-O4KxDTdHa8kVRPlJXrVnRLdLoiCRuJ5LFQgiwarVVcEJxLvhg39zfs4ViRmm48Tc9Ul2m&usqp=CAE",
  ];
  get productIndex => null;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.texCilor,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: controller.userData['imageUrl'] != null
                  ? NetworkImage(controller.userData['imageUrl'])
                  : const AssetImage('assets/placeholder.png') as ImageProvider,
              radius: 25, // Adjust image size
            ),
            const SizedBox(width: 10),
          ],
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              width: 220,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          Obx(() {
            return IconButton(
              onPressed: () {
                Get.to(CartScreen());
              },
              icon: Stack(
                children: [
                  const Icon(
                    Icons.shopping_cart_rounded,
                    color: AppColor.texCilor,
                  ),
                  if (cartController.cartItems.isNotEmpty)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red,
                        child: Text(
                          '${cartController.cartItems.length}',
                          style: const TextStyle(
                              color: AppColor.textColor, fontSize: 12),
                        ),
                      ),
                    ),
                ],
              ),
            );
          }),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: CarouselSlider.builder(
                itemCount: images.length,
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index; // Update the current index
                    });
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), // Border Radius
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.10),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        images[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                              child: Text('Image not available'));
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _currentIndex == index ? 12.0 : 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(categories[index]['image']!),
                          radius: 30,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          categories[index]['name']!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Sale',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return buildImageCard(
                    product['imageUrl']!,
                    product['labelText']!,
                    product['price']!,
                    index,
                  );
                },
              ),
            ),
            SizedBox(
              child: StreamBuilder<List<Map<String, String>>>(
                stream: imageUrlsStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No images available.'));
                  }

                  List<bool> likedProducts = List<bool>.filled(snapshot.data!.length, false);

                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      childAspectRatio: 0.8,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final item = snapshot.data![index];
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                    product: {
                                      'title': 'Trending Product',
                                      'price': item['price'] ?? 'Rs. 0',
                                      'image': item['url'] ?? '',
                                    },
                                    productIndex: index,
                                    labelText: '',
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          child: Image.network(
                                            item['url'] ?? '',
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        // const Positioned(
                                        //   bottom: 115,
                                        //   right: 0,
                                        //   child:  CircleAvatar(
                                        //       backgroundColor: Colors.white,
                                        //       child: Icon(Icons.favorite_border, color: Colors.black,)),
                                        // ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: const Text(
                                            'Trending',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          item['price'] ?? 'Rs. 0',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildImageCard(
      String imageUrl, String labelText, String price, int index) {
    return Container(
      width: 220.0, // Fixed typo here
      margin: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigate to ProductDetailScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen1(
                        imageUrl: imageUrl,
                        labelText: labelText,
                        price: price,
                        productId: index.toString(),
                        description: '',
                      ),
                    ),
                  );
                },
                child: Image.network(
                  imageUrl,
                  height: 270,
                  width: 220,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                labelText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
            ],
          ),
          // Positioned(
          //   bottom: 294,
          //   right: 2.0,
          //   child: CircleAvatar(
          //     backgroundColor: Colors.white,
          //     radius: 20.0,
          //     child: IconButton(
          //       icon: const Center(child: Icon(Icons.favorite_border, color: Colors.black)),
          //       onPressed: () {
          //
          //       },
          //     ),
          //   ),
          // ),
          // Uncomment and adjust if needed
          // Positioned(
          //   bottom: 40.0,
          //   left: 50.0,
          //   right: 50.0,
          //   child: SizedBox(
          //     width: 100,
          //     height: 45,
          //     child: ElevatedButton(
          //       onPressed: () {
          //         final item = {
          //           'image': imageUrl,
          //           'title': labelText,
          //           'price': price,
          //         };
          //         cartController.addToCart(item);
          //         Fluttertoast.showToast(
          //           msg: "Added to Cart",
          //           toastLength: Toast.LENGTH_SHORT,
          //           gravity: ToastGravity.BOTTOM,
          //           backgroundColor: Colors.green,
          //           textColor: Colors.white,
          //         );
          //       },
          //       style: ElevatedButton.styleFrom(
          //         backgroundColor: Colors.indigo[900],
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(10),
          //         ),
          //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //         textStyle: const TextStyle(
          //           fontSize: 16,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.black,
          //         ),
          //       ),
          //       child: const Text(
          //         'Add to Cart',
          //         style: TextStyle(
          //           fontSize: 16,
          //           fontWeight: FontWeight.bold,
          //           color: AppColor.texCilor,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

}
