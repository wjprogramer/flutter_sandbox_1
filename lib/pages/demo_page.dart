import 'package:flutter/material.dart';
import 'package:flutter_sandbox_1/demo_collection/cubit_demo/cubit_demo_page.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Collection'),
      ),
      body: ListView(
        children: [
          _subTitle('PKG: flutter_bloc'),
          _button('Cubit', CubitDemoPage()),
        ],
      ),
    );
  }

  Widget _subTitle(String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 8),
        child: Text(text),
      ),
    );
  }

  Widget _button(String text, Widget page) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: Text(text),
    );
  }
}
