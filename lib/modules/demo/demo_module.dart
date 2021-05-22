import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sandbox_1/pages/demo_page.dart';

class DemoModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => DemoPage()),
  ];
}