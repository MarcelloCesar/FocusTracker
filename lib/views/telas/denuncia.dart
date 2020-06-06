import 'package:focustracker/views/componentes/titulo_tela.dart';
import 'package:flutter/material.dart';
import 'package:focustracker/config/constantes.dart';
import '../componentes/radio_denuncias.dart';


class TelaDenuncia extends StatefulWidget {
  TelaDenuncia({Key key}) : super(key: key);

  @override
  _TelaDenuncia createState() => _TelaDenuncia();
}

class _TelaDenuncia extends State<TelaDenuncia> {
  int tipo;
  TextEditingController _inputCEP = TextEditingController();
  TextEditingController _inputCoordenadas = TextEditingController();
  TextEditingController _inputObservacoes = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    this.tipo = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TituloTela(
              titulo: "Denúncias",
              estilo: TextStyle(fontSize: 35)
          ),
          _formDenuncia(context),
          _botoesDenuncia(context)
        ],
      ),
    );
  }

  Widget _formDenuncia(BuildContext context){
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.05,
        margin: EdgeInsets.only(top: 12, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _inputCEP,
              decoration: InputDecoration(labelText: "CEP"),
              validator: _validadorCEP,
            ),
            TextFormField(
              controller: _inputCoordenadas,
              decoration: InputDecoration(labelText: "Coordenadas"),
            ),
            TextFormField(
              controller: _inputObservacoes,
              decoration: InputDecoration(labelText: "Observações"),
            ),
            RadioDenuncia(aoSelecionarRegiao: atualizaTipoDenuncia),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: FlatButton(
                color: Colors.lightBlue,
                onPressed: () => enviaFoto(),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: Text("Carregar Imagem", style: TextStyle(color: Colors.white)),
              ),
            )
          ]
        ),
      ),
    );
  }

  Widget _botoesDenuncia(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 50),
          child: FlatButton(
            color: Colors.red,
            onPressed: () => enviaFoto(),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Text("Cancelar", style: TextStyle(color: Colors.white)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 50),
          child: FlatButton(
            color: Colors.green,
            onPressed: () => enviaFoto(),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Text("Confirmar", style: TextStyle(color: Colors.white)),
          ),
        )
      ],
    );
  }

  String _validadorCEP(String data) {
    if ((data.length != 8) || (data.contains(new RegExp(r'[^0-9]'), 1))) {
      return "CEP inválido";
    }
    return null;
  }

  void atualizaTipoDenuncia(String tipo){
    setState(() {
      switch(tipo){
        case 'Foco':
          this.tipo = 1;
          break;

        case 'Caso':
          this.tipo = 2;
          break;

        case 'Criadouro':
          this.tipo = 3;
          break;

      }
    });
  }

  void enviaFoto(){
  }
}

