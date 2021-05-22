import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sandbox_1/models/product_model.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  String _name = '';

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
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text('Your name is "${_name.isEmpty ? '-' : _name}" from event page popping')),
          ),
          TextButton(
            onPressed: () async {
              final name = await Modular.to.pushNamed<String>('/home/event');
              setState(() {
                _name = name ?? '';
              });
            },
            child: Text('Event',),
          ),
          Divider(),
        ],
      ),
    );
  }
}
