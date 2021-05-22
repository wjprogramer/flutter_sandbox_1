import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sandbox_1/blocs/simple_counter/simple_counter_cubit.dart';
import 'package:flutter_sandbox_1/demo_collection/cubit_demo/simple_cubit_counter.dart';

class CubitDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SimpleCounterCubit>(
      create: (BuildContext context) => SimpleCounterCubit(),
      child: SimpleCubitCounter(),
    );
  }
}