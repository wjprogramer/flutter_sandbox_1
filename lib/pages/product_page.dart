import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String? id;

  ProductPage({
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product ${id ?? '-'}'),
      ),
      body: Center(
        child: Text('Product ${id ?? '-'}'),
      ),
    );
  }
}
