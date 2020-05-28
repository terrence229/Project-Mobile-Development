import 'package:flutter/foundation.dart';
import 'package:woosttogo/models/item.dart';
import 'dart:collection';

/// Cart data model
class Cart extends ChangeNotifier {
  List<Item> _items = [];
  double _totalPrice = 0.0;
  String restaurantName;

  /// Returns items in a listview.
  UnmodifiableListView<Item> get items {
    return UnmodifiableListView(_items);
  }

  /// TODO: this is only for testing purposes!
  List<String> get orderList {
    List<String> returnList = [];

    for(Item item in _items) {
      returnList.add('${item.name} keer ${this.itemQuantity(item)}');
    }

    return returnList;
  }

  /// Returns the total price of everything inside the cart.
  double get totalPrice {
    _totalPrice = 0;

    for (Item item in _items) {
      double price = item.price * item.quantity;
      _totalPrice += price;
    }

    return _totalPrice;
  }

  /// Calculates the current price for the item passed to it.
  /// This also takes quantity into account.
  double itemPrice(Item itemToCalculate) {
    int index = _items.indexWhere((item) => item.name == itemToCalculate.name);

    // Takes index int to pull out correct item from list.
    double itemPrice = _items[index].quantity.toDouble() * _items[index].price;

    return itemPrice;
  }

  /// Gets quantity of item.
  int itemQuantity(Item itemToGetQuantityFrom) {
    int index =
        _items.indexWhere((item) => item.name == itemToGetQuantityFrom.name);

    // Takes index int to pull out correct item from list.
    int quantity = _items[index].quantity;

    return quantity;
  }

  /// Returns length of items list.
  int get itemCount {
    return _items.length;
  }

  /// Add item to list.
  void addItem(String newItemTitle, double newPrice, int quantity) {
    final item = Item(name: newItemTitle, price: newPrice, quantity: quantity);
    _items.add(item);

    notifyListeners();
  }

  /// Add one to quantity.
  void addQuantity(Item itemToChange) {
    int index = _items.indexWhere((item) => item.name == itemToChange.name);
    _items[index].quantity += 1;
    notifyListeners();
  }

  /// Remove one from quantity.
  void removeQuantity(Item itemToChange) {
    int index = _items.indexWhere((item) => item.name == itemToChange.name);
    _items[index].quantity -= 1;
    notifyListeners();
  }

  void deleteItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }

  /// Empties the entire cart.
  void emptyCart() {
    _items = [];
  }
}
