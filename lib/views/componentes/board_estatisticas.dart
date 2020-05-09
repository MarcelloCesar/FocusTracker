import 'package:flutter/material.dart';
import '../../models/dados_estatisticos.dart';

class BoardEstatisticas extends StatelessWidget {

  final DadosEstatisticos dadosEstatisticos;

  BoardEstatisticas(this.dadosEstatisticos);

  @override
  Widget build(BuildContext context){
    final double fontSize = 65;
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  this.dadosEstatisticos.confirmados.toString(),
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  "Confirmados"
                )
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  this.dadosEstatisticos.suspeitos.toString(),
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.yellow
                  ),
                ),
                Text(
                  "Suspeitos"
                )
              ]
            ),
            Column(
              children: <Widget>[
                Text(
                  this.dadosEstatisticos.descartados.toString(),
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.blue
                  ),
                ),
                Text(
                  "Descartados"
                )
              ]
            )
         ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  this.dadosEstatisticos.curados.toString(),
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.green,
                  ),
                ),
                Text(
                  "Curados"
                )
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  this.dadosEstatisticos.obitos.toString(),
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.red,
                  ),
                ),
                Text(
                  "Óbitos"
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}