import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sandbox_1/models/product_model.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              Modular.to.pushNamed('/home/product/1');
            },
            child: Text('Product 1'),
          ),
          TextButton(
            onPressed: () {
              Modular.to.pushNamed('/home/product/1/rating');
            },
            child: Text('Product 1 Rating'),
          ),
          TextButton(
            onPressed: () {
              Modular.to.navigate('/home/product/1/rating');
            },
            child: Text('Product 1 Rating by navigate'),
          ),
          TextButton(
            onPressed: () {
              final product = ProductModel(
                id: '5',
                name: 'Bike',
                price: 20,
              );
              Modular.to.navigate('/home/product/model', arguments: product);
            },
            child: Text('Product Details',),
          ),
        ],
      ),
    );
  }
}
