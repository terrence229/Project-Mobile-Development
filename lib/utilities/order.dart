import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:woosttogo/models/cart.dart';

/// Order handling utility
class Order extends ChangeNotifier {
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  Cart cart;

  /// Sends order to Firebase.
  /// 
  /// The method checks if the user is logged in before sending the order.
  /// Returns false if the order couldn't be added to Firebase.
  Future<bool> sendOrder(Cart userCart) async {
    try {
      final user = await _auth.currentUser();
      if(user != null) {
        loggedInUser = user;
        print('Hello user ${user.email}!');
      }

      _firestore.collection('orders').add({
        'email': user.email.isNotEmpty ? user.email : 'Quick Order User',
        'restaurant': userCart.restaurantName,
        'date': DateTime.now(),
        'order': userCart.orderList.toString(),
        'paid' : userCart.totalPrice
      });

      return true;
    } catch (e) {
      print(e);
      return false;
    }

  }
}
