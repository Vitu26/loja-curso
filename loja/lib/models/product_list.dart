import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/data/dammy_data.dart';
import 'package:shop/models/products.dart';

class ProductList with ChangeNotifier {
  final _baseUrl = 'https://heloconvite-c3684-default-rtdb.firebaseio.com';

  final List<Product> _items = dummyProducts;
//filtrando os favoritos de forma global

  List<Product> get items => [..._items];

  List<Product> get favoriteItems =>
      _items.where((prod) => prod.isFavorito).toList();

  int get itemsCount {
    return _items.length;
  }

  void saveProduct(Map<String, Object> data) {
    bool hasId = data['id'] != null;

    final product = Product(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );
    if (hasId) {
      updateProduct(product);
    } else {
      addProduct(product);
    }
  }

  void addProduct(Product product) {
    http.post(
      Uri.parse('$_baseUrl/products.json')
    );
    _items.add(product);
    notifyListeners();
  }

  void updateProduct(Product product) {
    int index = _items.indexWhere((p) => p.id == product.id);
    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void removeProduct(Product product) {
    int index = _items.indexWhere((p) => p.id == product.id);
    if (index >= 0) {
      _items.removeWhere((p) => p.id == product.id);
      notifyListeners();
    }
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