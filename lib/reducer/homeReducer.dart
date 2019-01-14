import 'package:flutter_app/action/action.dart';
import 'package:flutter_app/model/listItem.dart';

ListItem homeReducer(ListItem state, action){
  if(action is AddAction){
    // ListItem listItem = (ListItem)state;
    return ListItem(items : []
      ..addAll(state.items)
      ..add(action.input));
  }
  return ListItem(items : state.items);
}