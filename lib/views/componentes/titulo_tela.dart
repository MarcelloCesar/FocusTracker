

import 'package:flutter/cupertino.dart';

class TituloTela extends StatelessWidget{

  final String titulo;
  final TextStyle estilo;
  TituloTela({this.titulo, this.estilo});

  @override
  Widget build(BuildContext context){
    return Container(
      child: Center(
        child: Text(
            this.titulo,
            style: this.estilo
          ),
      ),
      margin: EdgeInsets.only(
        bottom: 35,
        top: 45,
      ),
    );
  }
}