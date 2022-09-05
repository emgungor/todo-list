import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/items.dart';

class ItemDataBase with ChangeNotifier {
  final List<Items> _items = [
    // Items(title: "Task 3"),
    // Items(title: "Task 2"),
    // Items(title: "Task 1"),
  ];

  static late SharedPreferences _sharedPref;
  List<String> _itemsAsString = [];

  void toggleStatus(int index) {
    _items[index].toggleStatus();
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  void addItem(String title) {
    _items.add(Items(title: title));
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index); // can delete list items
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  UnmodifiableListView<Items> get items => UnmodifiableListView(_items);

  Future<void> createPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  void saveItemsToSharedPref(List<Items> items) {
    //List <Items> ---> List<String>

    _itemsAsString.clear();

    for (var items in items) {
      _itemsAsString.add(jsonEncode(items.toMap()));
    }

    _sharedPref.setStringList("ToDoData", _itemsAsString);
  }

  void loadItemsFromSharedPref() {
    List<String>? tempList = _sharedPref.getStringList("ToDoData")??[];
    _items.clear();

    for (var items in tempList) {
      _items.add(Items.fromMap(jsonDecode(items)));
    }
  }
}
