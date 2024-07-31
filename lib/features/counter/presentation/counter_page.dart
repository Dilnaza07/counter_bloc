import 'package:counter_bloc/features/counter/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:counter_bloc/features/counter/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    //BlocProvider
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    //cubit
    final cubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CounterWatchText()],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: cubit.increment,
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: cubit.decrement,
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (BuildContext context, state) {
        return Text(
          '${state.counter}',
          style: Theme.of(context).textTheme.headlineLarge,
        );
      },
    );
  }
}


class CounterWatchText extends StatelessWidget {
  const CounterWatchText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterState>().counter;
        return Text(
          '${counter}',
          style: Theme.of(context).textTheme.headlineLarge,
        );
  }
}