

import 'package:flutter/cupertino.dart';

class TituloTela extends StatelessWidget{

  final String titulo;
  TituloTela(this.titulo);

  @override
  Widget build(BuildContext context){
    return Container(
      child: Center(
        child: Text(
            this.titulo,
            style: TextStyle(
              fontSize: 35
            ),
          ),
      ),
      margin: EdgeInsets.only(
        bottom: 35,
        top: 45,
      ),
    );
  }
}