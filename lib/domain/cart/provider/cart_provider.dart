import 'package:flutter/widgets.dart';

class CartStateManager extends ChangeNotifier {
  int _itemsInCart = 0;

  get itemsInCart => _itemsInCart;

  void addItemToCart() {
    _itemsInCart++;
    notifyListeners();
  }
  
  void removeItemFromCart() {
    _itemsInCart--;
    notifyListeners();
  }
}

// A global variable managing the whole cart state
final cartStateManager = CartStateManager();
