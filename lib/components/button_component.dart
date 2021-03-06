


import 'package:flutter/material.dart';





class ButtonComponent extends StatelessWidget {

  final String title;
  final bool hasBorder;
  final double fontSize;
  final String rota;

  ButtonComponent({
    this.title,
    this.hasBorder,
    this.fontSize,
    this.rota,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, rota);
      },
      child: Material(
        child: Ink(
          decoration: BoxDecoration(
            color: hasBorder ? Colors.white : Color.fromRGBO(122, 165, 210, 1.0),
            borderRadius: BorderRadius.circular(0),
            border: hasBorder ? Border.all(
                color: Colors.white,
                width: 1.0,
            )
            : Border.fromBorderSide(BorderSide.none)
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            child: Container(    
              height: 45.0,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: hasBorder ? Color.fromRGBO(122, 165, 210, 1.0): Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize,           
                  ),
                ), 
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget redirect(String _rota, context){
  onPressed: () async{
    var retorno = await Navigator.pushNamed(
      context,
      _rota
    );
  };
}