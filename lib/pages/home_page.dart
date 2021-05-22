import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sandbox'),
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              Modular.to.pushNamed('/login');
            },
            child: Text('Login'),
          )
        ],
      ),
    );
  }
}
