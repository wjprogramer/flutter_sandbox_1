import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart' show Disposable;

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> implements Disposable {
  AppBloc() : super(AppInitial());

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }

  /// In Modular, `Disposable` classes are automatically disposed when out of the module scope.
  @override
  void dispose() {

  }
}
