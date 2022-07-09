import 'package:flutter/widgets.dart';


class HomeStateManager extends ChangeNotifier {
  String _categorySelectedCard = "All";

  get categorySelectedCard => _categorySelectedCard;

  void updateCategoryCard (String category){
    _categorySelectedCard = category;
    notifyListeners();
  }
  
}

// A global variable managing the whole app state
final homeStateManager = HomeStateManager();
