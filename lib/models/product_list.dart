import 'package:flutter/material.dart';
import 'package:shop/data/dammy_data.dart';
import 'package:shop/models/products.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;
//filtrando os favoritos de forma global


  List<Product> get items => [..._items];

  List<Product> get favoriteItems => _items.where((prod) => prod.isFavorito).toList();

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}


  // bool _showFavorityOnly = false;

  // List<Product> get items {
  //   if (_showFavorityOnly) {
  //     return _items.where((prod) => prod.isFavorito).toList();
  //   }
  //   return [..._items];
  // }

  // void showFavoriteOnly() {
  //   _showFavorityOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavorityOnly = false;
  //   notifyListeners();
  // }