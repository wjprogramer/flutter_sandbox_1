import 'package:flutter/material.dart';
import 'package:flutter_sandbox_1/demo_collection/moor_demo_2/database/database.dart';
import 'package:flutter_sandbox_1/utilities/component_utility.dart';

class MoorDemoPage2 extends StatefulWidget {
  @override
  _MoorDemoPage2State createState() => _MoorDemoPage2State();
}

class _MoorDemoPage2State extends State<MoorDemoPage2> {

  final _db = MyDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moor'),
      ),
      body: ListView(
        children: [
          _button('DB', () {
            // _db.createCategory('Bike');
          }),
          _button('...', () {
          }),
          _button('', () {

          }),
          _button('', () {

          }),
          StreamBuilder(
            stream: _db.categoriesWithCount(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print("snapshot $snapshot");
              return Column(
                children: snapshot.data != null ? (snapshot.data as List)
                    .where((e) => e is CategoryWithCount)
                    .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text((e as CategoryWithCount).category?.description ?? '-'),
                ))
                    .toList() : [],
              );
              return Text('');
            },
          ),
        ],
      ),
    );
  }

  Widget _button(String text, Function onPressed) {
    return ComponentUtility.button(context, text, onPressed: onPressed);
  }
}
