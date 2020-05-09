import 'package:flutter/material.dart';
import '../componentes/barra_navegacao.dart';
import '../componentes/select_doencas.dart';
import '../componentes/titulo_tela.dart';
import '../componentes/radio_alcance.dart';
import '../componentes/board_estatisticas.dart';

class TelaEstatisticas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estatísticas',
      home: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              TituloTela("Estatísticas"),
              SelectDoencas(),
              RadioAlcance(),
              BoardEstatisticas(),
            ],
          ),
        ),
        bottomNavigationBar: BarraNavegacao(true)
      )
    );
  }
}