import 'package:flutter/material.dart';
import 'package:flutter_app/model/rootReducer.dart';
import 'package:flutter_app/page/home.dart';
import 'package:flutter_app/reducer/reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = Store<RootReducer>(reducer, initialState : RootReducer.initialState());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreProvider<RootReducer>(
      store : store,
      child : MaterialApp(
        theme : ThemeData.dark(),
        title : "Redux List App",
        home : Home()
      )
    );
  }
}
