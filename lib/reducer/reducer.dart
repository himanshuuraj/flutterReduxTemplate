
import 'package:flutter_app/model/listItem.dart';
import 'package:flutter_app/model/rootReducer.dart';
import 'package:flutter_app/reducer/homeReducer.dart';

RootReducer reducer(RootReducer state, action){
  RootReducer rootReducer = RootReducer();

  ListItem listItem = homeReducer(state.getListItem(), action);
  rootReducer.setListItem(listItem);

  return rootReducer;
}