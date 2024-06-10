import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String id;

  const ProductDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // id'yi kullanarak ürün detaylarını alın ve gösterin
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Text('Product ID: $id'),
      ),
    );
  }
}
