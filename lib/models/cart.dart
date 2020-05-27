import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:woosttogo/models/item.dart';
import 'dart:collection';

class Cart extends ChangeNotifier {
  List<Item> _items = [
    Item(name: 'Big Mac', price: 2.0),
    Item(name: 'Vanilla Milkshake', price: 2.5),
    Item(name: 'Small fries', price: 1.0),
    Item(name: '20 nuggets', price: 5.0),
  ];

  UnmodifiableListView<Item> get items {
    return UnmodifiableListView(_items);
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String newItemTitle) {
    final item = Item(name: newItemTitle);
    _items.add(item);
    notifyListeners();
  }

  String get helloWorld {
    return "Hello, World!";
  }

  void deleteItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}
