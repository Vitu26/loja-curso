import 'package:flutter/material.dart';
import 'package:shop/pages/product_datails_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        hintColor: Colors.indigoAccent[100],
        fontFamily: 'Lato',
      ),
      home: ProductsOverview(),
      routes: {
        AppRoutes.PRODUCT_DATAILS: (ctx) => ProductDatails()
      },
    );
  }
}
