import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorito;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorito = false,
  });

  //método para alternar o valor de favorito
  void toggleFavorite() {
    isFavorito = !isFavorito;
    notifyListeners();
  }

  
}
