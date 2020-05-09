import 'package:flutter/material.dart';

class RadioAlcance extends StatefulWidget {

  RadioAlcance({Key key, @required this.aoSelecionarRegiao}) : super(key: key);

  final ValueChanged<String> aoSelecionarRegiao;

  @override
  _RadioAlcanceState createState() => _RadioAlcanceState();
}

class _RadioAlcanceState extends State<RadioAlcance> {

  final List<String> alcances = <String>[
    "Bairro",
    "Cidade",
    "País"
  ];

  String valorAtual;

  _RadioAlcanceState(){
    this.valorAtual = this.alcances[0];
  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: <Widget>[
              Radio(
                value: this.alcances[0],
                groupValue: this.valorAtual,
                onChanged: this.alteraRegiaoHandler,
              ),
              Text(
                this.alcances[0]
              )
            ]
          ),
          Row(
            children: <Widget>[
              Radio(
                value: this.alcances[1],
                groupValue: this.valorAtual,
                onChanged: this.alteraRegiaoHandler,
              ),
              Text(
                this.alcances[1]
              )
            ]
          ),
          Row(
            children: <Widget>[
              Radio(
                value: this.alcances[2],
                groupValue: this.valorAtual,
                onChanged: this.alteraRegiaoHandler,
              ),
              Text(
                this.alcances[2]
              )
            ]
          ),
        ],
      ),
      margin: EdgeInsets.only(
        bottom: 35,
        top: 45,
      ),
    );
  }

  void alteraRegiaoHandler(String valor) {
    setState(() {
      this.valorAtual = valor;
    });

    widget.aoSelecionarRegiao(this.valorAtual);
  }
}