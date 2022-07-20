import 'package:flutter/widgets.dart';

class HomeStateManager extends ChangeNotifier {
  String _categorySelectedCard = "All";
  bool _showScrollToTopFAB = false;
  double _mainScrollPositionPixel = 0.0;

  get categorySelectedCard => _categorySelectedCard;
  get showScrollToTopFAB => _showScrollToTopFAB;
  get mainScrollPositionPixel => _mainScrollPositionPixel;

  void updateCategoryCard(String category) {
    _categorySelectedCard = category;
    notifyListeners();
  }

  void updateshowScrollToTopFAB(bool showScrollToTopFAB) {
    _showScrollToTopFAB = showScrollToTopFAB;
    notifyListeners();
  }
   void updatemainScrollPositionPixel(double mainScrollPositionPixel) {
    _mainScrollPositionPixel = mainScrollPositionPixel;
    notifyListeners();
  }
}

// A global variable managing the whole app state
final homeStateManager = HomeStateManager();
