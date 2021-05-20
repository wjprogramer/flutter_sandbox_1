import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sandbox_1/modules/home/home_module.dart';
import 'package:flutter_sandbox_1/pages/home_page.dart';
import 'package:flutter_sandbox_1/pages/login_page.dart';

class AppModule extends Module {

  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/home', module: HomeModule()),
  ];

}