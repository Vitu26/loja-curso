import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_grid_item.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/models/products.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavoriteOnly;
  ProductGrid(this.showFavoriteOnly);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts = showFavoriteOnly ? provider.favoriteItems : provider.items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      //para definir o número de elementos que tem na lista
      itemCount: loadedProducts.length,
      //versão inicial para redenrizar cada elemento dentro do meu gridview
      // itemBuilder: (ctx, i) => Text(loadedProducts[i].title),
      //forma de contrução total do grid de produtos
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        child: ProducGridItem(),
      ),
      //essa classe define uma estrutura de gridview com 2 elementos por linha
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
