import 'package:counter_bloc/features/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    //BlocProvider
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    //cubit
    final bloc = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CounterText()],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.add(CounterIncrementPressed());
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              bloc.add(CounterDecrementPressed());
            },
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
    return BlocBuilder<CounterBloc, CounterState>(
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
    final counter = context.watch<CounterBloc>().state.counter;
    return Text(
      '${counter}',
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
