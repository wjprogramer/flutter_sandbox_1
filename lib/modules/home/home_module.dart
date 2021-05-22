import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sandbox_1/blocs/home/home_bloc.dart';
import 'package:flutter_sandbox_1/modules/home/home_controller.dart';
import 'package:flutter_sandbox_1/modules/list/list_widget.dart';
import 'package:flutter_sandbox_1/pages/event_page.dart';
import 'package:flutter_sandbox_1/pages/product_details_page.dart';
import 'package:flutter_sandbox_1/pages/product_page.dart';
import 'package:flutter_sandbox_1/pages/product_rating_page.dart';
import 'package:flutter_sandbox_1/route_transitions/my_custom_transition.dart';

import 'home_widget.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeBloc()),
    Bind.singleton((i) => HomeController(data: i.args?.data)),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomeWidget()),
    ChildRoute('/list', child: (_, args) => ListWidget()),
    ChildRoute(
      '/product/:id',
      child: (_, args) => ProductPage(id: args.params['id']),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/product/:id/rating',
      child: (_, args) => ProductRatingPage(id: args.params['id']),
      transition: TransitionType.custom,
      customTransition: myCustomTransition,
    ),
    ChildRoute('/product/model', child: (_, args) => ProductDetailsPage(
      productModel: args.data,
    )),
    ChildRoute<String>('/event', child: (_, __) => EventPage()),
  ];
}