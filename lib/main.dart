import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CounterBloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Demo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
      builder: (BuildContext context) => CounterBloc(),
    child : CounterScr(),
    )
    );
  }
}

class CounterScr extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<CounterBloc, int>(
            builder: (BuildContext context, int state){
              return Text("Count Value : $state", style: TextStyle(fontSize:
              30, decorationColor: Colors.deepOrange),);
            },
          ),


          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("  Increment  "),
                elevation: 10,
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red),
                ),
                padding: const EdgeInsets.all(0.0),
                textColor:Colors.white,
                onPressed: (){
                  _counterBloc.add(CounterEvents.increment);
                },
              ),

              RaisedButton(
                child: Text("  Decrement  "),
                elevation: 10,
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red),
                ),
                padding: const EdgeInsets.all(0.0),
                textColor:Colors.white,
                onPressed: (){
                  _counterBloc.add(CounterEvents.decrement);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}



