import 'package:flutter/foundation.dart';
import 'models/bachelor.dart';

class BachelorLikes extends ChangeNotifier {
  List<Bachelor> likedBachelors = [];

  void addLikedBachelor(Bachelor bachelor) {
    likedBachelors.add(bachelor);
    notifyListeners();
  }

  void removeLikedBachelor(Bachelor bachelor) {
    likedBachelors.remove(bachelor);
    notifyListeners();
  }

  bool isLiked(Bachelor bachelor) {
    return likedBachelors.contains(bachelor);
  }
}
