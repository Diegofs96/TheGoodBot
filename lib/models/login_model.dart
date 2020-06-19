
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_good_bot/shared/globals.dart';



class LoginModel extends ChangeNotifier {
  Global global = new Global();


  get isVisible => _isVisible;
  bool _isVisible = false;
  set isVisible(value){
    _isVisible = value;
    notifyListeners();
  }


  get isValid => _isValid;
  bool _isValid = false;

  void isValidEmail(String input) {
    if (input == Global.validEmail.first){
      _isValid = true;
    }
    else {
      _isValid = false;
    }
    notifyListeners();
    
  }

 
  



}