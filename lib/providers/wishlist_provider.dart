import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';

class WishlistProvider with ChangeNotifier {
  final List<Product> _wishlist = [];

  List<Product> get wishlist => _wishlist;

  bool isFavorite(Product product) {
    return _wishlist.contains(product);
  }

  void toggleFavorite(Product product) {
    if (isFavorite(product)) {
      _wishlist.remove(product);
    } else {
      _wishlist.add(product);
    }
    notifyListeners();
  }
}
