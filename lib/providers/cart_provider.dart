import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<Product, int> _items = {};

  Map<Product, int> get items => _items;

  double get totalPrice {
    double total = 0.0;
    _items.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product)) {
      _items.update(product, (existingValue) => existingValue + 1);
    } else {
      _items.putIfAbsent(product, () => 1);
    }
    notifyListeners();
  }

  void removeItem(Product product) {
    if (_items.containsKey(product) && _items[product]! > 1) {
      _items.update(product, (existingValue) => existingValue - 1);
    } else {
      _items.remove(product);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
