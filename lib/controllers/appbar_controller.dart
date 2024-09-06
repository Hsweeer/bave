import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomBarProvider with ChangeNotifier {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  int _navbarIndex = 0;
  bool _tappedOnChat = false;
  int get navbarIndex => _navbarIndex;

  bool get tappedOnChat => _tappedOnChat;

  // Setter for clip
  set tappedOnChat(bool value) {
    _tappedOnChat = value;
    notifyListeners(); // Notify listeners about the change
  }

  void updateNavbarIndex(int index) {
    _navbarIndex = index;
    controller.jumpToTab(index);
    notifyListeners();
  }
}
