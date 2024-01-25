import 'package:flutter/material.dart';
import 'package:shop/components/product_item.dart';
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
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        //para definir o número de elementos que tem na lista
        itemCount: loadedProducts.length,
        //versão inicial para redenrizar cada elemento dentro do meu gridview
        // itemBuilder: (ctx, i) => Text(loadedProducts[i].title),
        //forma de contrução total do grid de produtos
        itemBuilder: (ctx, i) => ProductItem(product: loadedProducts[i]),
        //essa classe define uma estrutura de gridview com 2 elementos por linha
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      
      ),
    );
  }
}
