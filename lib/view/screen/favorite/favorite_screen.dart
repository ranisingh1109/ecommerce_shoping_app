import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/favorites/favorites_controller.dart';


class FavoriteScreen extends StatelessWidget {
  final List<Map<String, String>> products =
  [
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

  @override
  Widget build(BuildContext context) {
    final FavoritesController3 favoritesController = Get.find<FavoritesController3>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: Obx(() {
        final favorites = favoritesController.favorites;

        if (favorites.isEmpty) {
          return const Center(
            child: Text("No favorites yet!"),
          );
        }
        return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final favoriteIndex = favorites[index];
            final product = products[favoriteIndex];

            return Card(
              child: ListTile(
                leading: Image.network(product['imageUrl']!),
                title: Text(product['labelText']!),
                subtitle: Text(product['price']!),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    favoritesController.toggleFavorite(favoriteIndex);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}


