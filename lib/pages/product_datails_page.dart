// import 'package:flutter/material.dart';
// import 'package:shop/models/products.dart';

// class ProductDatails extends StatelessWidget {
//   const ProductDatails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Product product =
//         ModalRoute.of(context)?.settings.arguments as Product;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product.name),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 300,
//               width: double.infinity,
//               child: Image.network(
//                 product.imageUrl,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(height: 10,),
//             Text(
//               'R\$ ${product.price}',
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 20,
//               ),
//             ),
//             SizedBox(height: 10,),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               width: double.infinity,
//               child: Text(
//                 product.description,
//                 textAlign: TextAlign.center,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shop/models/products.dart'; // Ensure this path is correct

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Safely attempt to extract a Product from the arguments
    final arguments = ModalRoute.of(context)?.settings.arguments;
    // Check if arguments is actually a Product, otherwise, handle the error or provide a fallback
    if (arguments is! Product) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Product not found or invalid arguments provided.'),
        ),
      );
    }

    final Product product = arguments; // Now safe to cast

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'R\$ ${product.price}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                product.description,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

