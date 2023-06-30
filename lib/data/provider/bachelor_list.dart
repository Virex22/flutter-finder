import 'package:flutter/foundation.dart';
import '../../models/bachelor.dart';
import 'package:finder/data/generator/bachelor_generator.dart' as data_provider;

class BachelorList extends ChangeNotifier {
  List<Bachelor> bachelorList = [];

  BachelorList() {
    bachelorList = data_provider.BachelorGanerator().generateFakeBachelors();
  }

  void addBachelor(Bachelor bachelor) {
    bachelorList.add(bachelor);
    notifyListeners();
  }

  void removeBachelor(Bachelor bachelor) {
    bachelorList.remove(bachelor);
    notifyListeners();
  }

  void setBachelors(List<Bachelor> bachelors) {
    bachelorList = bachelors;
    notifyListeners();
  }
}
