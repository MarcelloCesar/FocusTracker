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
  int doenca;
  int regiao;

  @override
  void initState() {
    super.initState();
    this.doenca = 1;
    this.regiao = 1;

    this.dados = fetchDadosEstatisticos(this.doenca, this.regiao);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            TituloTela(titulo: "Estatísticas", estilo: TextStyle(fontSize: 35)),
            SelectDoencas(aoSelecionarDoenca: this._atualizaDadosEstatisticosDoenca),
            RadioAlcance(aoSelecionarRegiao: this._atualizaDadosEstatisticosRegiao),
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
    );
  }

  void _atualizaDadosEstatisticosRegiao(String regiaoSelecionada) {
    setState(() {
      switch(regiaoSelecionada){
        case 'Bairro':
          this.regiao = 1;
          break;

        case 'Cidade':
          this.regiao = 2;
          break;

        case 'País':
          this.regiao = 3;
          break;

      }

      this.dados = fetchDadosEstatisticos(this.doenca, this.regiao);
    });
  }

  void _atualizaDadosEstatisticosDoenca(String doencaSelecionada) {
    setState(() {
      switch(doencaSelecionada){
        case 'Corona Vírus':
          this.doenca = 1;
          break;

        case 'Dengue':
          this.doenca = 2;
          break;

        case 'Zika':
          this.doenca = 3;
          break;

      }

      this.dados = fetchDadosEstatisticos(this.doenca, this.regiao);
    });
  }
}