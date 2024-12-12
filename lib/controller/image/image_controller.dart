import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
   final FirebaseStorage _storage = FirebaseStorage.instance;

   Stream<List<Map<String, String>>> fetchAllImagesWithDetails() async* {
      while (true) {
         await Future.delayed(const Duration(seconds: 1));
         try {
            ListResult result = await _storage.ref('shoping').listAll();
            List<Map<String, String>> imagesWithDetails = [];

            for (var item in result.items) {
               String url = await item.getDownloadURL();
               imagesWithDetails.add({
                  'url': url,
                  'price': 'Rs. ${(500 + imagesWithDetails.length * 500)}',
               });
            }

            yield imagesWithDetails;
         } catch (e) {
            print("Error fetching image URLs: $e");
            yield [];
         }
      }
   }
}
