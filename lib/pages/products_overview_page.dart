import 'package:flutter/material.dart';
import 'package:shop/components/products_grid.dart';
import 'package:shop/data/dammy_data.dart';
import 'package:shop/models/products.dart';

class ProductsOverview extends StatelessWidget {
  final List<Product> loadedProducts = dummyProducts;
  ProductsOverview({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
        backgroundColor: Colors.blue[200],
      ),
      body: ProductGrid(),
    );
  }
}

