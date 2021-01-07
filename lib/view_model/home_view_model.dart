import 'package:ecommerceapp/view/auth/accountscreen.dart';
import 'package:ecommerceapp/view/auth/cartscreen.dart';
import 'package:ecommerceapp/view/auth/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
  int _selectedValue = 0;
  get selectedvalue => _selectedValue ;
  Widget _currentScreen = HomeScreen();
  get currentScreen => _currentScreen ;
  void changeSelectedValue(int selected){
  _selectedValue = selected;
  switch(selected) {
    case 0 : {
      _currentScreen = HomeScreen();
      break;
    }
    case 1: {
      _currentScreen = CartScreen();
      break;
    }
    case 2: {
     _currentScreen = AccountScreen();
      break;
    }
  }
  update();
  }

}