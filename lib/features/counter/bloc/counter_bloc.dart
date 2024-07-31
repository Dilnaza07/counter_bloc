import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 0)) {
    on<CounterIncrementPressed>(_onIncrementPressed);
    on<CounterDecrementPressed>(_onDecrementPressed);
  }

  void _onIncrementPressed(
      CounterIncrementPressed event, Emitter<CounterState> emit) {
    emit(CounterState(counter: state.counter + 1));
  }

  void _onDecrementPressed(
      CounterDecrementPressed event, Emitter<CounterState> emit) {
    emit(CounterState(counter: state.counter - 1));
  }
}
