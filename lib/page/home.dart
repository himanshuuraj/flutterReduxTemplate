import 'package:flutter/material.dart';
import 'package:flutter_app/action/action.dart';
import 'package:flutter_app/global/request.dart';
import 'package:flutter_app/model/listItem.dart';
import 'package:flutter_app/model/rootReducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Redux List"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
              ],
            ),
            Column(
              children: <Widget>[
                ListInput()
              ],
            ),
            ViewList(),
          ],
        ),
      ),
    );
  }
}

typedef AddItem(String text);

class _ViewModel {
  final AddItem addItemToList;
  _ViewModel({this.addItemToList});
}

class ListInput extends StatefulWidget {
  @override
  ListInputState createState() => ListInputState();
}

class ListInputState extends State<ListInput> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StoreConnector<RootReducer, _ViewModel>(
        converter: (store) => _ViewModel(
          addItemToList: (inputText) => store.dispatch(
            AddAction(input: inputText),
          ),
        ),
        builder: (context, viewModel) => TextField(
            decoration: InputDecoration(hintText: "Enter an Item"),
            controller: controller,
            onSubmitted: (text) async {
              String str = await ApiCall.postData("", "", "");
              print(str);
            }
//            onSubmitted: (text) {
//              print("This is String literal just like Java");
//              print(text);
//              viewModel.addItemToList(text);
//              controller.text = "";
//            }
            ));

  }
}

class ViewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<RootReducer, ListItem>(
      converter: (store) => store.state.listItem,
      builder: (context, listItem) => Column(
        children: listItem.items.map((i) => ListTile(title: Text(i))).toList(),
      ),
    );
  }
}