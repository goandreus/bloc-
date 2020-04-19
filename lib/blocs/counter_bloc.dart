import 'package:bloc/bloc.dart';

enum CounterEvents {increment, decrement, reset}

class CounterBloc extends Bloc<CounterEvents, int>{
  @override
  int get initialState => 100;

  @override
  Stream<int> mapEventToState(CounterEvents event) async* {
    if(event == CounterEvents.increment){
      yield this.state +1;
    }else if(event == CounterEvents.decrement){
      yield this.state -1;
    }else if(event == CounterEvents.reset){
      yield 100;
    }
  }

}