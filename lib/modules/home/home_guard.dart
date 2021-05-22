import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sandbox_1/modules/app/app_module.dart';

/// Route guards are middleware-like objects that allow you to control the access of a given route from other route.
/// You can implement a route guard by making a class that `implements RouteGuard`.
///
/// For example, the following class will only allow a redirection from `/login` route:
class HomeGuard implements RouteGuard {
  /// Return `true` to allow access
  /// Return `false` to disallow access
  @override
  Future<bool> canActivate(String url, ModularRoute route) async {
    // Modular will evaluate all your async dependencies before going to HomeModule.
    await Modular.isModuleReady<AppModule>();

    if (url != '/login'){
      return true;
    } else {
      return false;
    }
  }
}