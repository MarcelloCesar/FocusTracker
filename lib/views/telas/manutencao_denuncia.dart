import 'package:focustracker/views/componentes/titulo_tela.dart';
import 'package:flutter/material.dart';
import '../componentes/barra_navegacao.dart';
import 'package:focustracker/config/constantes.dart';
import 'package:focustracker/models/denuncia.dart';
import 'package:focustracker/servicos/denuncia.dart';
import '../componentes/board_denuncia.dart';

class TelaManutencao extends StatefulWidget {
  TelaManutencao({Key key}) : super(key: key);

  @override
  _TelaManutencao createState() => _TelaManutencao();
}

class _TelaManutencao extends State<TelaManutencao> {
  Future<Denuncia> dados;
  int id;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    this.id = 2;
    this.dados = fetchDadosDenuncia(this.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Container(
        child: Column(
          children: <Widget>[
            TituloTela(
                titulo: "Manutenção de Denúncia",
                estilo: TextStyle(fontSize: 35)
            ),
            FutureBuilder<Denuncia>(
              future: this.dados,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return BoardDenuncia(snapshot.data);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              }
            ),
            _botoesManutencao(context),
          ],
        ),
      ),
      ),
      bottomNavigationBar: BarraNavegacao(true),
    );
  }



  Widget _botoesManutencao(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 50),
      child: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.center,
              child: FlatButton(
                color: Color(Constantes.DARK_BLUE),
                onPressed: () => verImagem(context),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Text("Ver Imagem", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 150,
                child: FlatButton(
                  color: Color(Constantes.DARK_BLUE),
                  onPressed: () => alteraStatus(context, "confirma"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Text("Confirmar", style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 150,
                child: FlatButton(
                  color: Color(Constantes.DARK_BLUE),
                  onPressed: () => alteraStatus(context, "cancela"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Text("Cancelar", style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 25),
                width: 150,
                child: FlatButton(
                  color: Color(Constantes.DARK_BLUE),
                  onPressed: () => alteraStatus(context, "obito"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Text("Informar Óbito", style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                width: 150,
                child: FlatButton(
                  color: Color(Constantes.DARK_BLUE),
                  onPressed: () => alteraStatus(context, "cura"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Text("Informar Cura", style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void verImagem(BuildContext context){
    return;
  }

  void alteraStatus(BuildContext context, String tipo) async {
    bool resp = await alteraDenuncia(tipo, this.id);
    print(resp);
  }
}