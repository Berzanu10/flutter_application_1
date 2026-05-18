import 'package:flutter/material.dart';

import 'models/product_model.dart';
import 'screens/cart_screen.dart';
import 'screens/discover_screen.dart';
import 'screens/product_detail_screen.dart';

void main() {
  runApp(const MiniCatalogApp());
}

class MiniCatalogApp extends StatefulWidget {
  const MiniCatalogApp({Key? key}) : super(key: key);

  @override
  State<MiniCatalogApp> createState() => _MiniCatalogAppState();
}

class _MiniCatalogAppState extends State<MiniCatalogApp> {
  final List<Product> _cart = [];

  void _addToCart(Product product) {
    setState(() {
      _cart.add(product);
    });
  }

  void _clearCart() {
    setState(() {
      _cart.clear();
    });
  }

  void _openCart(BuildContext context) {
    Navigator.pushNamed(context, '/cart');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Catalog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => DiscoverScreen(
              cart: _cart,
              onCartPressed: () => _openCart(context),
            ),
        '/detail': (context) => ProductDetailScreen(
              onAddToCart: _addToCart,
            ),
        '/cart': (context) => CartScreen(
              cartItems: _cart,
              onClearCart: _clearCart,
            ),
      },
    );
  }
}
