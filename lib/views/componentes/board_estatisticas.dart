import 'package:flutter/material.dart';

class BoardEstatisticas extends StatelessWidget {

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
                  "50",
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
                  "28",
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.yellow
                  ),
                ),
                Text(
                  "Descartados"
                )
              ]
            ),
            Column(
              children: <Widget>[
                Text(
                  "14",
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
                  "50",
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.green,
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
                  "50",
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.red,
                  ),
                ),
                Text(
                  "Confirmados"
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}