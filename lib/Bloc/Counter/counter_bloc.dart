import 'package:bloc/bloc.dart';
import 'package:bloc_state/Bloc/Counter/counter_state.dart';

import 'counter_event .dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(counter: 0)) {
    on<Increment>(_onIncrement);
    on<Decrement>(_onDecrement);
    on<Reset>(_onReset);
  }

  void _onIncrement(Increment event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _onDecrement(Decrement event, Emitter<CounterState> emit) {

    if (state.counter>0){
    emit(state.copyWith(counter: state.counter - 1));}
  }
  void _onReset(Reset event, Emitter<CounterState>emit){
    emit(state.copyWith(counter: 0));
  }
}
