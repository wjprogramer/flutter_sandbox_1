import 'package:flutter/material.dart';

class ProductRatingPage extends StatelessWidget {
  final String id;

  ProductRatingPage({
    String? id,
  }): id = id ?? '-';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        title: Text('Product $id Rating'),
      ),
      body: Center(
        child: Icon(
          Icons.star,
          size: 50,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
