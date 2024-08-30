import 'package:get/get.dart';

class FavoriteController extends GetxController {
  // Use a Set to store the IDs of favorite ads
  final RxSet<String> _favoriteAds = <String>{}.obs;

  // Check if an ad is favorite
  bool isFavorite(String adId) => _favoriteAds.contains(adId);

  // Toggle the favorite state of an ad
  void toggleFavorite(String adId) {
    if (_favoriteAds.contains(adId)) {
      _favoriteAds.remove(adId);
    } else {
      _favoriteAds.add(adId);
    }
  }
}
