import 'package:flutter/material.dart';
import 'package:flutter_sandbox_1/demo_collection/cubit_demo/cubit_demo_page.dart';
import 'package:flutter_sandbox_1/demo_collection/moor_demo/moor_demo_page.dart';
import 'package:flutter_sandbox_1/demo_collection/moor_demo_2/moor_demo_page_2.dart';
import 'package:flutter_sandbox_1/utilities/component_utility.dart';

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
          Divider(),
          _subTitle('PKG: moor'),
          _button('Simple (Commented)', MoorDemoPage()),
          _button('Simple', MoorDemoPage2()),
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
    return ComponentUtility.button(context, text, page: page);
  }
}
