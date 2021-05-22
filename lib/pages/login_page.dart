import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              Modular.to.pushNamed('/home');
            },
            child: Text('Home'),
          ),
          TextButton(
            onPressed: () {
              final path = '/home/list';
              Modular.to.pushNamed(path);
            },
            child: Text('List'),
          ),
        ],
      ),
    );
  }
}
