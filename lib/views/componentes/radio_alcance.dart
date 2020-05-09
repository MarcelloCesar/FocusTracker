import 'package:flutter/material.dart';

class RadioAlcance extends StatefulWidget {

  RadioAlcance({Key key}) : super(key: key);

  @override
  _RadioAlcanceState createState() => _RadioAlcanceState();
}

class _RadioAlcanceState extends State<RadioAlcance> {

  final List<String> alcances = <String>[
    "Bairro",
    "Cidade",
    "Pais"
  ];

  String valorAtual;

  _RadioAlcanceState(){
    this.valorAtual = this.alcances[0];
  }

  @override
  Widget build(BuildContext context){
    return Row(
      children: <Widget>[

      ],
    );
  }
}