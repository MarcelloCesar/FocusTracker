import 'package:flutter/material.dart';
import 'package:focustracker/models/dados_estatisticos.dart';
import '../componentes/barra_navegacao.dart';
import '../componentes/select_doencas.dart';
import '../componentes/titulo_tela.dart';
import '../componentes/radio_alcance.dart';
import '../componentes/board_estatisticas.dart';
import 'package:focustracker/servicos/estatisticas.dart';

class TelaEstatisticas extends StatefulWidget {
  TelaEstatisticas({Key key}) : super(key: key);

  @override
  _TelaEstatisticas createState() => _TelaEstatisticas();
}
class _TelaEstatisticas extends State<TelaEstatisticas> {
  Future<DadosEstatisticos> dados;

  @override
  void initState() {
    super.initState();
    this.dados = fetchDadosEstatisticos();
  }

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
              FutureBuilder<DadosEstatisticos> (
                future: this.dados,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return BoardEstatisticas(snapshot.data);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return CircularProgressIndicator();
                }
              )
            ],
          ),
        ),
        bottomNavigationBar: BarraNavegacao(true)
      )
    );
  }
}