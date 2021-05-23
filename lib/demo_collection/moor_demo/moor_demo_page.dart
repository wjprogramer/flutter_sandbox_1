import 'package:flutter/material.dart';
import 'package:flutter_sandbox_1/demo_collection/moor_demo/moor_data.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:test/test.dart';

class MoorDemoPage extends StatefulWidget {
  @override
  _MoorDemoPageState createState() => _MoorDemoPageState();
}

class _MoorDemoPageState extends State<MoorDemoPage> {
  FlutterQueryExecutor _executor = FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite', logStatements: true);
  late MyDatabase _db;

  @override
  void initState() {
    super.initState();
    _db = MyDatabase(_executor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moor Demo'),
      ),
      body: ListView(
        children: [
          _button('Start', () async {
            var i = 0;
            String slowQuery() => '''
              with recursive slow(x) as (values(1) union all select x+1 from slow where x < 1000000)
              select ${i++} from slow;
            '''; // ^ to get different `StreamKey`s

            await _db.doWhenOpened((e) {});

            final subscriptions = List.generate(
                4, (_) => _db.customSelect(slowQuery()).watch().listen(null));
            await pumpEventQueue();
            await Future.wait(subscriptions.map((e) => e.cancel()));

            await _db.customSelect('select 1').getSingle();
          }),
          _button('Test', () async {
            print(_db.recipes);
            print(await _db.select(_db.recipes).get());
            _db.into(_db.recipes);
            print(_db.recipes);
            print(_db.recipes);


          }),
        ],
      ),
    );
  }

  Widget _button(String text, VoidCallback action) {
    return TextButton(
      onPressed: action,
      child: Text(text),
    );
  }
}
