import 'package:focustracker/views/componentes/titulo_tela.dart';
import 'package:flutter/material.dart';
import '../componentes/barra_navegacao.dart';
import 'package:focustracker/config/constantes.dart';

// TODO -> Terminar esta tela, trazer a listagem de denuncias com id
class TelaListagem extends StatefulWidget {
  TelaListagem({Key key}) : super(key: key);

  @override
  _TelaListagem createState() => _TelaListagem();
}

class _TelaListagem extends State<TelaListagem> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var denunciaWidgets = List<Widget>();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Container(
        child: Column(
          children: <Widget>[
            TituloTela(
                titulo: "Listagem de Denúncias",
                estilo: TextStyle(fontSize: 35)
            ),
          ],
        ),
      ),
      ),
      bottomNavigationBar: BarraNavegacao(true),
    );
  }
}