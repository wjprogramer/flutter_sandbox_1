import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  _HomeControllerBase({
    this.data,
  }) {
    print("Initialize home controller with data $data");
  }

  @observable
  dynamic data;

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}