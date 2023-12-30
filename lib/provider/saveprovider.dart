// import 'package:first_project/models/cart.dart';
// import 'package:flutter/foundation.dart';

// import '../models/product.dart';

// class SaveProvider extends ChangeNotifier {
//   final List<SavedItem> _items = [];

//   List<SavedItem> get items => _items;

//   void add(SavedItem item) {
//     _items.add(item);
//     notifyListeners();
//   }

//   void remove(SavedItem item) {
//     _items.removeWhere((SavedItem) => SavedItem == item);
//     notifyListeners();
//   }

//   bool contains(Product item) {
//     _items.contains(item);
//     final index = _items.indexWhere((element) => element.product.id == item.id);

//     return index >= 0;
//   }

//   bool get isEmpty => _items.isEmpty;
// }
