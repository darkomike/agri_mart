import 'package:flutter/widgets.dart';
import '../../main.dart';

class AppStateManager with ChangeNotifier {
  bool _loggedIn = prefs.getBool('loggedIn')!;
  bool _darkModeOn = false;
  String _navigationBottomSelected = 'home';
  String _userType = prefs.getString('userType')!;

  int _authPageIndex = 0;

  bool get loggedIn => _loggedIn;
  bool get darkModeOn => _darkModeOn;
  String get userType => _userType;
  String get navigationBottomSelected => _navigationBottomSelected;
  int get authPageIndex => _authPageIndex;

  setIsLoggedIn(bool isLoggedIn) {
    prefs.setBool('loggedIn', isLoggedIn);
    _loggedIn = isLoggedIn;
    notifyListeners();
  }

  setIsDarkModeOn(bool isDarkModeOn) {
    _darkModeOn = isDarkModeOn;
    notifyListeners();
  }

  changeTheme(bool value) {
    setIsDarkModeOn(value);
  }

  changeAuthPageIndex(int value) {
    _authPageIndex = value;
    notifyListeners();
  }

  changeNavigationBottomSelected(String value) {
    _navigationBottomSelected = value;
    notifyListeners();
  }

  setUserType(String userType) {
    _userType = userType;
    notifyListeners();
  }
}

// A global variable managing the whole app state
final appStateManager = AppStateManager();
