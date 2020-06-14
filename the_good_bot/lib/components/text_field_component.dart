


import 'package:flutter/material.dart';
import 'package:the_good_bot/models/login_model.dart';



class TextFieldComponent extends StatelessWidget {
    final String hintText;
    final IconData prefixIconData;
    final IconData suffixIconData;
    final bool obscureText;
    final Function onChanged;


  TextFieldComponent({
    this.hintText,
    this.prefixIconData,
    this.suffixIconData,
    this.obscureText,
    this.onChanged,
  });


  @override
  Widget build(BuildContext context) {
     LoginModel loginModel = new LoginModel();
    return TextField(
      onChanged: onChanged,
      style: TextStyle(
        color: Colors.white
      ),
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(
            prefixIconData,
            size: 18,
            color: Colors.white
        ),
        //filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          //borderSide: BorderSide.,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
        ),
        suffixIcon: GestureDetector(
          onTap: (){
            loginModel.isVisible = !loginModel.isVisible;
          },
          child: Icon(
              suffixIconData,
              size: 18,
              color: Colors.white,
          ),
        ),
        labelStyle: TextStyle(
          color: Colors.white
        ),
        focusColor: Colors.white
      ),
    );
  }
}



