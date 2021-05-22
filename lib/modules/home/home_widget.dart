import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
          )
        ],
      ),
    );
  }
}
