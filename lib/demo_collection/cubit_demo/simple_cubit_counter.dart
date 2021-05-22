import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sandbox_1/blocs/simple_counter/simple_counter_cubit.dart';

class SimpleCubitCounter extends StatefulWidget {
  @override
  _SimpleCubitCounterState createState() => _SimpleCubitCounterState();
}

class _SimpleCubitCounterState extends State<SimpleCubitCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocBuilder<SimpleCounterCubit, int>(
        builder: (context, count) => Center(child: Text('$count')),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 'F1',
              child: const Icon(Icons.add),
              onPressed: () => context.read<SimpleCounterCubit>().increment(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 'F2',
              child: const Icon(Icons.remove),
              onPressed: () => context.read<SimpleCounterCubit>().decrement(),
            ),
          ),
        ],
      ),
    );
  }
}
