import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sandbox_1/modules/home/home_guard.dart';
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
    // Simple route using the ChildRoute
    ChildRoute('/', child: (_, __) => HomePage()),
    ChildRoute('/login', child: (_, __) => LoginPage()),
    ModuleRoute(
      '/home',
      module: HomeModule(),
      guards: [ HomeGuard() ],
      // Add a routing route if `RouteGuard` validation fails by adding the `guardedRoute` property:
      guardedRoute: '/login',
    ),
  ];

}