import 'package:flutter/widgets.dart';

class ProductStateManager extends ChangeNotifier {
  int _totalProducts = 1;

  get totalProducts => _totalProducts;

  
}

// A global variable managing the whole product state
final productStateManager = ProductStateManager();
