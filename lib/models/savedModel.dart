
import 'package:flutter/foundation.dart';
import 'package:project/models/jobesmodel.dart';

class SavedModel extends ChangeNotifier {
  final List<Job> _savedItems = [];

  List<Job> get savedItems => _savedItems;

  void addToCart(Job items) {
    _savedItems.add(items);
    notifyListeners();
  }
}
