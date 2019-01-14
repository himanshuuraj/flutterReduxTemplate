import 'package:flutter_app/model/listItem.dart';

class RootReducer{
  ListItem listItem;

  getListItem(){
    return listItem;
  }

  RootReducer();

  setListItem(ListItem list){
    listItem = list;
  }

  RootReducer.initialState() : listItem = ListItem.initialState();
}