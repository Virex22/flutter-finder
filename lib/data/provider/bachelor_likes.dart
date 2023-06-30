import 'package:flutter/foundation.dart';
import '../../models/bachelor.dart';

class BachelorLikes extends ChangeNotifier {
  final List<Bachelor> _likedBachelors = [];

  List<Bachelor> get likedBachelors => List.unmodifiable(_likedBachelors);

  void addLikedBachelor(Bachelor bachelor) {
    _likedBachelors.add(bachelor);
    notifyListeners();
  }

  void removeLikedBachelor(Bachelor bachelor) {
    _likedBachelors.remove(bachelor);
    notifyListeners();
  }

  bool isLiked(Bachelor bachelor) {
    return _likedBachelors.contains(bachelor);
  }
}
