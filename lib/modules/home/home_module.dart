import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sandbox_1/blocs/home/home_bloc.dart';
import 'package:flutter_sandbox_1/modules/list/list_widget.dart';

import 'home_widget.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomeWidget()),
    ChildRoute('/list', child: (_, args) => ListWidget()),
  ];
}