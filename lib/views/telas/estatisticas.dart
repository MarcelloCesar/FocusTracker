import 'package:flutter/material.dart';
import '../componentes/barra_navegacao.dart';

class TelaEstatisticas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estatísticas',
      home: Scaffold(
        /*body: Container(
          child: DropdownButton(
            onChanged: (){},

          )
        )*/
        bottomNavigationBar: BarraNavegacao(true)
      )
    );
  }
}