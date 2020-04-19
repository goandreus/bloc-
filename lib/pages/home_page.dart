import 'package:bloc_project/blocs/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final CounterBloc _counterBloc = CounterBloc();
  @override
  void dispose() {

    //counterbloc is stream, is close for memory deprecated
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build home');
    return BlocProvider.value(
          value: _counterBloc,
          child: Scaffold(
          body: Center(
            child: BlocBuilder<CounterBloc, int>(
              builder: (_,state){
                return Text("Counter is $state");
              }),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              //more count floating action button is 'herotag' why no is 
              // recomendable more the one floating action button for view
              FloatingActionButton(
                heroTag: 'increment',
                onPressed: (){
                  _counterBloc.add(CounterEvents.increment);
                },
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                heroTag: 'drecement',
                onPressed: (){
                  _counterBloc.add(CounterEvents.decrement);
                },
                child: Icon(Icons.remove),
              ),
              FloatingActionButton(
                heroTag: 'reset',
                onPressed: (){
                  _counterBloc.add(CounterEvents.reset);
                },
                child: Icon(Icons.restore),
              ),
            ],
          ),
      ),
    );
  }
}