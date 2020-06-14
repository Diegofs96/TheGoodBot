
/* Pacotes padrão do Flutter */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//Importando nossos componentes
import 'package:the_good_bot/components/button_component.dart';
import 'package:the_good_bot/components/text_field_component.dart';
import 'package:the_good_bot/models/login_model.dart';
import 'package:the_good_bot/shared/globals.dart';




class LoginScreen extends StatelessWidget { 

   // Declarando nossas models
 LoginModel loginModel = new LoginModel();
 Global global = new Global();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(122, 165, 210, 1.0),
      
      body: Padding(         
        padding: const EdgeInsets.all(30.0),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.end,
           children: <Widget>[
             Container(
               height: size.height / 3.0,
               decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("${global.imageLogo}"),
                    fit: BoxFit.cover,
                  ),
               ),
             ),
             SizedBox(
                height: 60.0,
              ),
              TextFieldComponent (
                  hintText: "E-mail",
                  obscureText: false,
                  prefixIconData: Icons.mail_outline,
                  suffixIconData: loginModel.isValid ? Icons.check : Icons.check,
                  onChanged: (value){
                    loginModel.isValidEmail(value);
                  },
              ),
              
              SizedBox(
                height: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextFieldComponent (
                      hintText: 'Password',
                      obscureText: loginModel.isVisible ? false : true,
                      prefixIconData: Icons.lock_outline,
                      suffixIconData: 
                      loginModel.isVisible  ? Icons.visibility_off : Icons.visibility_off,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Esqueceu sua Senha?",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              ButtonComponent(
                title: "Entrar",
                hasBorder: true,
                fontSize: 20.0
              ), 
              SizedBox(
                height: 20.0,
              ),
              ButtonComponent(
                title: "Não tem uma conta? Junte-se a nós!",
                hasBorder: false,
                fontSize: 12.0
              )
            ],
         ),
      ),
    );
  }
}