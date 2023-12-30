import 'package:flutter/foundation.dart';
import 'package:project/models/jobesmodel.dart';

class SavedModel extends ChangeNotifier {
  final List<Job> _savedItems = [];

  List<Job> get savedItems => _savedItems;

  void addToCart(Job item) {
    _savedItems.add(item);
    notifyListeners();
  }

  void removeFromCart(Job item) {
    if (_savedItems.contains(item)) {
      _savedItems.remove(item);
      notifyListeners();
    }
  }

}
