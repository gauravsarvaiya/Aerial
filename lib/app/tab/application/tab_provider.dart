import 'package:flutter/foundation.dart';

class TabProvider extends ChangeNotifier{

  int currentIndex = 0;
  bool isProfile = false;

  webProfile(bool profile){
    isProfile = profile;
    notifyListeners();
  }

  tabChangeIndex({required int index}){
    currentIndex = index;
    notifyListeners();
  }

  updateTab(String tabText){
    notifyListeners();
  }

}