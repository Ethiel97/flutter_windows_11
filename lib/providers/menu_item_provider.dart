import 'package:flutter/cupertino.dart';
import 'package:flutter_windows_11/models/menu_item.dart';

class MenuItemProvider with ChangeNotifier {
  MenuItem? menuItem;

  setItem(menuItem) {
    this.menuItem = menuItem;
    notifyListeners();
  }

  get item => menuItem;
}
