import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sandbox_1/blocs/app/app_bloc.dart';
import 'package:flutter_sandbox_1/models/product_model.dart';
import 'package:flutter_sandbox_1/modules/home/home_guard.dart';
import 'package:flutter_sandbox_1/modules/home/home_module.dart';
import 'package:flutter_sandbox_1/pages/home_page.dart';
import 'package:flutter_sandbox_1/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

final myObject = ProductModel(id: '1', name: 'Cake', price: 12.0);

class AppModule extends Module {

  // Provide a list of dependencies to inject into your project
  // Ex: BLoCs, ChangeNotifier classes or stores(MobX)
  @override
  final List<Bind> binds = [
    Bind((i) => AppBloc()),
    // Factory: Instantiate the class whenever it gets called.
    Bind.factory((i) => AppBloc()),
    // Instance: Use a class that has already been instantiated.
    Bind.instance(myObject),
    // Singleton: Create a Global instance of a class
    Bind.singleton((i) => AppBloc()),
    // LazySingleton: Create a Global instance of a class only when it gets called for the first time.
    Bind.lazySingleton((i) => AppBloc()),
    AsyncBind((i) => SharedPreferences.getInstance())
  ];

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