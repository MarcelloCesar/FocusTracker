import 'package:focustracker/views/componentes/titulo_tela.dart';
import 'package:flutter/material.dart';
import '../componentes/barra_navegacao.dart';
import 'package:focustracker/config/constantes.dart';
import 'package:focustracker/views/telas/listaDenuncia.dart';

class TelaAdm extends StatefulWidget {
  TelaAdm({Key key}) : super(key: key);

  @override
  _TelaAdm createState() => _TelaAdm();
}

class _TelaAdm extends State<TelaAdm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
            TituloTela(
                titulo: "Painel Administrativo",
                estilo: TextStyle(fontSize: 35)
            ),
            _botoesAdm(context),
          ],
        ),
      ),
      ),
      bottomNavigationBar: BarraNavegacao(true),
    );
  }

  Widget _botoesAdm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          height: 50,
          width: 1000,
          margin: EdgeInsets.only(top: 50),
          child: FlatButton(
            color: Color(Constantes.DARK_BLUE),
            onPressed: () => criaListagem(context),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0)),
            child: Text("Gerenciar Denúncias", style: TextStyle(color: Colors.white, fontSize: 23)),
          ),
        )
      ],
    );
  }

  void criaListagem(BuildContext context){
    Navigator.pushReplacementNamed(context, '/gerenciamento');
  }

}