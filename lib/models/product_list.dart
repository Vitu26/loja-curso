import 'package:flutter/material.dart';
import 'package:shop/data/dammy_data.dart';
import 'package:shop/models/products.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
