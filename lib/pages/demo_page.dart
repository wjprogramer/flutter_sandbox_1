import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Collection'),
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }

  Widget _button(String text, String routeName) {
    return TextButton(
      onPressed: () {
        Modular.to.pushNamed(routeName);
      },
      child: Text(text),
    );
  }
}
